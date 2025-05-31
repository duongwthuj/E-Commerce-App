import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/features/shop/controllers/cart_controller.dart';
import 'package:thuctapcoso/features/shop/models/cart_item_model.dart';
import 'package:thuctapcoso/features/shop/models/order_model.dart';
import 'package:thuctapcoso/utlis/constants/enums.dart';
import 'package:thuctapcoso/utlis/popups/loaders.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final cartController = CartController.instance;

  // Tạo đơn hàng mới
  Future<void> createOrder(
      List<CartItemModel> items, double totalAmount) async {
    try {
      // Tạo đơn hàng mới
      final order = OrderModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        items: items,
        totalAmount: totalAmount,
        status: OrderStatus.processing,
        createdAt: DateTime.now(),
      );

      // Lưu đơn hàng vào Firestore
      await _db.collection('Orders').doc(order.id).set(order.toJson());

      // Cập nhật số lượng sản phẩm
      for (var item in items) {
        await _updateProductStock(item);
      }

      // Xóa giỏ hàng
      cartController.clearCart();

      // Hiển thị thông báo thành công
      TLoaders.successSnackBar(
        title: 'Success',
        message: 'Order placed successfully',
      );

      // Chuyển hướng đến trang đơn hàng
      Get.offAllNamed('/orders');
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Error',
        message: e.toString(),
      );
    }
  }

  // Cập nhật số lượng sản phẩm
  Future<void> _updateProductStock(CartItemModel item) async {
    try {
      final productRef = _db.collection('Products').doc(item.productId);
      final productDoc = await productRef.get();

      if (productDoc.exists) {
        final productData = productDoc.data() as Map<String, dynamic>;

        if (item.selectedVariation != null &&
            item.selectedVariation!.isNotEmpty) {
          // Cập nhật số lượng cho biến thể sản phẩm
          final variants = List<Map<String, dynamic>>.from(
              productData['ProductVariants'] ?? []);
          for (var i = 0; i < variants.length; i++) {
            final variant = variants[i];
            if (_isMatchingVariant(
                variant['AttributesValues'], item.selectedVariation!)) {
              variants[i]['Stock'] = (variant['Stock'] as int) - item.quantity;
              break;
            }
          }
          await productRef.update({'ProductVariants': variants});
        } else {
          // Cập nhật số lượng cho sản phẩm đơn giản
          final currentStock = productData['Stock'] as int;
          await productRef.update({'Stock': currentStock - item.quantity});
        }
      }
    } catch (e) {
      print('Error updating product stock: $e');
      rethrow;
    }
  }

  // Kiểm tra xem biến thể có khớp không
  bool _isMatchingVariant(Map<String, dynamic> variantAttributes,
      Map<String, String> selectedAttributes) {
    if (variantAttributes.length != selectedAttributes.length) return false;
    for (final key in variantAttributes.keys) {
      if (variantAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  // Lấy danh sách đơn hàng
  Future<List<OrderModel>> getOrders() async {
    try {
      final snapshot = await _db
          .collection('Orders')
          .orderBy('CreatedAt', descending: true)
          .get();
      return snapshot.docs
          .map((doc) => OrderModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Error',
        message: e.toString(),
      );
      return [];
    }
  }
}
