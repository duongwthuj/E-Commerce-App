import 'package:get/get.dart';
import 'package:thuctapcoso/data/repositories/brand/brand_repository.dart';
import 'package:thuctapcoso/data/repositories/product/product_repository.dart';
import 'package:thuctapcoso/features/shop/models/brand_model.dart';
import 'package:thuctapcoso/features/shop/models/product_model.dart';
import 'package:thuctapcoso/utlis/popups/loaders.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();
  Rx<bool> isLoading = false.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  Future<void> getFeaturedBrands() async {
    try {
      isLoading.value = true;
      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);

      featuredBrands.assignAll(
          brands.where((brand) => brand.isFeatured ?? false).take(4).toList());
      isLoading.value = false;
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Error',
        message: 'Failed to get featured brands',
      );
    }
  }

  Future<List<ProductModel>> getBrandProducts({required String brandId, int limit = -1}) async {
    try {
      final products = await ProductRepository.instance
          .getProductsForBrand(brandId: brandId, limit: limit);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }


  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
  try {
    final brands = await brandRepository.getBrandsForCategory(categoryId);
    return brands;
  } catch (e) {
    TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    return [];
  }
}

 
}
