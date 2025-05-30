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
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();

      return snapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  /// GET ALL PRODUCTS
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final snapshot = await _db.collection('Products').get();
      return snapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  /// GET PRODUCTS BY QUERY
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final snapshot = await query.get();
      return snapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ProductModel>> getProductsForBrand({required String brandId, int limit = -1}) async {
  try {
    final querySnapshot = limit == -1
        ? await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).get()
        : await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).limit(limit).get();

    final products = querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();

    return products;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again';
  }
}
}
