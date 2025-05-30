import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thuctapcoso/data/dataTest/dummy_products.dart';

class UploadProducts {
  static Future<void> uploadProducts() async {
    final firestore = FirebaseFirestore.instance;
    final productsCollection = firestore.collection('Products');

    try {
      // Upload each product
      for (var product in TDummyProducts.products) {
        // Convert product to JSON
        final productData = product.toJson();
        
        // Add product to Firestore
        await productsCollection.doc(product.id).set(productData);
        
        print('Uploaded product: ${product.title}');
      }
      
      print('All products uploaded successfully!');
    } catch (e) {
      print('Error uploading products: $e');
    }
  }
}