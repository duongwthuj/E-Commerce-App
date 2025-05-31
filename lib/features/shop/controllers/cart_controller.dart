import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:thuctapcoso/features/shop/controllers/product/varitation_controller.dart';
import 'package:thuctapcoso/features/shop/models/cart_item_model.dart';
import 'package:thuctapcoso/features/shop/models/product_model.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  // Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;
  late SharedPreferences _prefs;

  @override
  void onInit() {
    super.onInit();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    loadCartItems();
  }

  // Load cart items from SharedPreferences
  void loadCartItems() {
    final String? cartItemsJson = _prefs.getString('cart_items');
    if (cartItemsJson != null) {
      final List<dynamic> decodedItems = json.decode(cartItemsJson);
      cartItems.value =
          decodedItems.map((item) => CartItemModel.fromJson(item)).toList();
      _updateCartTotals();
    }
  }

  // Save cart items to SharedPreferences
  Future<void> _saveCartItems() async {
    final String encodedItems =
        json.encode(cartItems.map((item) => item.toJson()).toList());
    await _prefs.setString('cart_items', encodedItems);
  }

  // Get current quantity in cart for a product
  int getCurrentQuantityInCart(
      String productId, Map<String, String>? selectedVariation) {
    final existingItem = cartItems.firstWhere(
      (element) =>
          element.productId == productId &&
          element.selectedVariation == selectedVariation,
      orElse: () => CartItemModel.empty(),
    );
    return existingItem.quantity;
  }

  // Get stock for selected variation
  int getStockForVariation(
      ProductModel product, Map<String, String>? selectedVariation) {
    if (selectedVariation == null || selectedVariation.isEmpty) {
      return product.stock;
    }

    // Find matching variation in product
    for (var variation in product.productVariants ?? []) {
      bool isMatch = true;
      for (var entry in selectedVariation.entries) {
        if (variation.attributes == null ||
            variation.attributes![entry.key] != entry.value) {
          isMatch = false;
          break;
        }
      }
      if (isMatch) {
        return variation.stock;
      }
    }
    return 0; // No matching variation found
  }

  // Check if product can be added to cart
  bool canAddToCart(ProductModel product, int quantity,
      Map<String, String>? selectedVariation) {
    // Get stock for selected variation
    final variationStock = getStockForVariation(product, selectedVariation);
    if (variationStock <= 0) {
      Get.snackbar(
        'Error',
        'Selected variation is out of stock.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }

    // Get current quantity in cart
    final currentQuantity =
        getCurrentQuantityInCart(product.id, selectedVariation);

    // Check if adding this quantity would exceed stock
    if (currentQuantity + quantity > variationStock) {
      final remainingStock = variationStock - currentQuantity;
      Get.snackbar(
        'Error',
        remainingStock > 0
            ? 'Cannot add more. Only $remainingStock items available for selected variation.'
            : 'Selected variation is out of stock.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }

    return true;
  }

  // Add item to cart
  void addToCart(CartItemModel item, ProductModel product) {
    if (!canAddToCart(product, item.quantity, item.selectedVariation)) {
      return;
    }

    final existingItemIndex = cartItems.indexWhere((element) =>
        element.productId == item.productId &&
        element.selectedVariation == item.selectedVariation);

    if (existingItemIndex >= 0) {
      cartItems[existingItemIndex].quantity += item.quantity;
    } else {
      // Store product stock in cart item
      item.stock = getStockForVariation(product, item.selectedVariation);
      cartItems.add(item);
    }
    _saveCartItems();
    _updateCartTotals();

    Get.snackbar(
      'Success',
      'Product added to cart',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  // Remove item from cart
  void removeFromCart(int index) {
    cartItems.removeAt(index);
    _saveCartItems();
    _updateCartTotals();
  }

  // Update item quantity
  void updateQuantity(int index, int quantity) {
    if (quantity > 0) {
      final item = cartItems[index];
      // Check if new quantity would exceed stock
      if (quantity <= item.stock) {
        cartItems[index].quantity = quantity;
        _saveCartItems();
        _updateCartTotals();
      } else {
        Get.snackbar(
          'Error',
          'Cannot update quantity. Only ${item.stock} items available for selected variation.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  // Update cart totals
  void _updateCartTotals() {
    noOfCartItems.value = cartItems.fold(0, (sum, item) => sum + item.quantity);
    totalCartPrice.value =
        cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  // Clear cart
  void clearCart() {
    cartItems.clear();
    _saveCartItems();
    _updateCartTotals();
  }
}

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
  }
}
