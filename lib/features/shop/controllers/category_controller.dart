import 'package:get/get.dart';
import 'package:thuctapcoso/data/repositories/categories/category_repository.dart';
import 'package:thuctapcoso/features/shop/models/category_model.dart';
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
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId == null).take(8).toList());
    } catch(e){
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    } 
  }
}
