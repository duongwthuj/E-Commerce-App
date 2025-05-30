import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/features/shop/models/product_model.dart';
import 'package:thuctapcoso/utlis/exceptions/firebase_exceptions.dart';
import 'package:thuctapcoso/utlis/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// GET LIMITED FEATURED PRODUCTS
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      print('Fetching featured products from Firestore...');
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      print('Found ${snapshot.docs.length} featured products');

      final products = <ProductModel>[];

      for (var doc in snapshot.docs) {
        try {
          print('Processing document: ${doc.id}');
          final product = ProductModel.fromSnapshot(doc);
          products.add(product);
          print('Successfully processed product: ${product.title}');
        } catch (e) {
          print('Error processing document ${doc.id}: $e');
          // Bỏ qua sản phẩm lỗi và tiếp tục với sản phẩm tiếp theo
          continue;
        }
      }

      print('Successfully processed ${products.length} products');
      return products;
    } on FirebaseException catch (e) {
      print('Firebase error: ${e.message}');
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      print('Platform error: ${e.message}');
      throw TPlatformException(e.code).message;
    } catch (e) {
      print('Unknown error: $e');
      throw e.toString();
    }
  }
}
