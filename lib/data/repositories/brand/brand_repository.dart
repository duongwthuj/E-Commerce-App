import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/features/shop/models/brand_catagory_model.dart';
import 'package:thuctapcoso/features/shop/models/brand_model.dart';
import 'package:thuctapcoso/utlis/exceptions/firebase_exceptions.dart';
import 'package:thuctapcoso/utlis/exceptions/format_exceptions.dart';
import 'package:thuctapcoso/utlis/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // get all categories
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      return snapshot.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
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

  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // Get all brand-category relationships for this category
      final brandCategorySnapshot = await _db
          .collection('BrandCategories')
          .where('categoryId', isEqualTo: categoryId)
          .get();

      // Extract brand IDs
      final brandIds = brandCategorySnapshot.docs
          .map((doc) => doc['brandId'] as String)
          .toList();

      if (brandIds.isEmpty) {
        return [];
      }

      // Get all brands that match these IDs
      final brandsSnapshot = await _db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .get();

      return brandsSnapshot.docs
          .map((doc) => BrandModel.fromSnapshot(doc))
          .toList();
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
