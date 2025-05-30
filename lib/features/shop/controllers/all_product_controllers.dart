import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/data/repositories/product/product_repository.dart';
import 'package:thuctapcoso/features/shop/models/product_model.dart';
import 'package:thuctapcoso/utlis/popups/loaders.dart';

class AllProductController extends GetxController {
  static AllProductController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductQuery(Query query) async {
    try {
      if (query == null) {
        return [];
      }

      final products = await repository.fetchProductsByQuery(query);
      this.products.assignAll(products);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;
    switch (sortOption) {
      case 'Name':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Higher Price':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Lower Price':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Sale':
        products.sort((a, b) => b.salePrice.compareTo(a.salePrice));
        break;
      case 'Newest':
        products.sort((a, b) =>
            (b.date ?? DateTime.now()).compareTo(a.date ?? DateTime.now()));
        break;
      case 'Popularity':
        // Implement popularity sorting logic here
        break;
    }
  }

  void assignProducts(List<ProductModel> Products) {
    products.assignAll(Products);
    sortProducts('Name');
  }
}
