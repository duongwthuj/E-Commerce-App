import 'package:get/get.dart';
import 'package:thuctapcoso/data/repositories/categories/category_repository.dart';
import 'package:thuctapcoso/data/repositories/product/product_repository.dart';
import 'package:thuctapcoso/features/shop/models/category_model.dart';
import 'package:thuctapcoso/features/shop/models/product_model.dart';
import 'package:thuctapcoso/utlis/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
    // getAllCategories();
  }

  // Load categories date
  Future<void> fetchCategories() async {
    try {
      // show loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source (firebase, api, etc   )
      final categories = await _categoryRepository.getAllCategories();
      // Update the state
      allCategories.assignAll(categories);
      // filter featured categories
      featuredCategories.assignAll(allCategories
          .where(
              (category) => category.isFeatured && category.parentId!.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryId, int limit = 4}) async {
    // Fetch limit(4) products against each subCategory.
    final products = await ProductRepository.instance
        .getProductsForCategory(categoryId: categoryId, limit: limit);
    return products;
  }

  Future<List<CategoryModel>> getSubCategoryProducts(
      {required String categoryId, int limit = 4}) async {
    // Fetch limit(4) products against each subCategory.
    final subCategories =
        await _categoryRepository.getSubCategories(categoryId);
    return subCategories;
  }
}
