import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:thuctapcoso/data/dataTest/dummy_brand_categories.dart';
import 'package:thuctapcoso/utlis/exceptions/firebase_exceptions.dart';
import 'package:thuctapcoso/utlis/exceptions/format_exceptions.dart';
import 'package:thuctapcoso/utlis/exceptions/platform_exceptions.dart';

class UploadDummyBrandCategories {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> uploadBrandCategories() async {
    try {
      // Get reference to the BrandCategories collection
      final brandCategoriesRef = _db.collection('BrandCategories');

      // Upload each brand category
      for (var brandCategory in TDummyBrandCategories.brandCategories) {
        // Create a new document with auto-generated ID
        await brandCategoriesRef.add({
          'brandId': brandCategory.brandId,
          'categoryId': brandCategory.categoryId,
        });
      }

      print('Successfully uploaded brand categories to Firestore');
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
