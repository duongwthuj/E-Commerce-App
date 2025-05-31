import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thuctapcoso/data/repositories/product/product_repository.dart';
import 'package:thuctapcoso/features/shop/models/product_model.dart';
import 'package:thuctapcoso/utlis/constants/colors.dart';
import 'package:thuctapcoso/utlis/helpers/helpFunction.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find();

  final _productRepository = ProductRepository();
  final RxList<String> favoriteProductIds = <String>[].obs;
  final RxList<ProductModel> favoriteProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  // Load danh sách productID từ SharedPreferences
  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFavorites = prefs.getStringList('favoriteProductIds') ?? [];
    favoriteProductIds.assignAll(savedFavorites);
    await getFavoriteProductDetails();
  }

  // Toggle trạng thái yêu thích và lưu vào SharedPreferences
  Future<void> toggleFavorite(String productId) async {
    if (favoriteProductIds.contains(productId)) {
      favoriteProductIds.remove(productId);
    } else {
      favoriteProductIds.add(productId);
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favoriteProductIds', favoriteProductIds);
    await getFavoriteProductDetails();
  }

  // Lấy chi tiết sản phẩm yêu thích từ Firebase
  Future<void> getFavoriteProductDetails() async {
    try {
      if (favoriteProductIds.isEmpty) {
        favoriteProducts.clear();
        return;
      }
      final products =
          await _productRepository.getFavoriteProducts(favoriteProductIds);
      favoriteProducts.assignAll(products);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load favorite products: $e');
    }
  }

  // Add product to favorites
  void addToFavorites(ProductModel product) {
    if (!favoriteProducts.contains(product)) {
      favoriteProducts.add(product);
      Get.snackbar(
        'Success',
        'Product added to favorites',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: TColors.primary,
        colorText: TColors.white,
        margin: const EdgeInsets.all(10),
        duration: const Duration(seconds: 2),
        icon: const Icon(Icons.favorite, color: TColors.white),
      );
    }
  }

  // Remove product from favorites
  void removeFromFavorites(ProductModel product) {
    favoriteProducts.remove(product);
    Get.snackbar(
      'Success',
      'Product removed from favorites',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: TColors.dark,
      colorText: TColors.white,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 2),
      icon: const Icon(Icons.favorite_border, color: TColors.white),
    );
  }

  // Check if product is in favorites
  bool isFavorite(ProductModel product) {
    return favoriteProducts.contains(product);
  }
}
