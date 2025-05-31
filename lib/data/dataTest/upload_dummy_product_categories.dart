 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:thuctapcoso/data/dataTest/dummy_product_categories.dart';
import 'package:thuctapcoso/utlis/exceptions/firebase_exceptions.dart';
import 'package:thuctapcoso/utlis/exceptions/format_exceptions.dart';
import 'package:thuctapcoso/utlis/exceptions/platform_exceptions.dart';

class UploadDummyProductCategories {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> uploadProductCategories() async {
    try {
      // Get reference to the ProductCategories collection
      final productCategoriesRef = _db.collection('ProductCategories');

      // Upload each product category
      for (var productCategory in TDummyProductCategories.productCategories) {
        // Create a new document with auto-generated ID
        await productCategoriesRef.add({
          'productId': productCategory.productId,
          'categoryId': productCategory.categoryId,
        });
      }

      print('Successfully uploaded product categories to Firestore');
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}