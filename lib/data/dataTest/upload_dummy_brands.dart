import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thuctapcoso/data/dataTest/dummy_brands.dart';

class UploadDummyBrands {
  static Future<void> uploadBrands() async {
    final firestore = FirebaseFirestore.instance;

    for (var brand in dummyBrands) {
      try {
        await firestore.collection('Brands').doc(brand.id).set(brand.toJson());
        print('Uploaded brand: ${brand.name}');
      } catch (e) {
        print('Error uploading brand ${brand.name}: $e');
      }
    }
  }
}
