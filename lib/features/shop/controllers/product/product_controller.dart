import 'package:get/get.dart';
import 'package:thuctapcoso/data/repositories/product/product_repository.dart';
import 'package:thuctapcoso/features/shop/models/product_model.dart';
import 'package:thuctapcoso/utlis/constants/enums.dart';
import 'package:thuctapcoso/utlis/popups/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      // print('Starting to fetch featured products...');
      isLoading.value = true;

      // Lấy sản phẩm từ repository
      final products = await productRepository.getFeaturedProducts();
      // print('Received ${products.length} products from repository');

      // Kiểm tra và xử lý từng sản phẩm
      final validProducts = products.where((product) {
        try {
          // Kiểm tra các trường bắt buộc
          if (product.title.isEmpty) {
            // print('Product ${product.id} has empty title');
            return false;
          }
          if (product.thumbnail.isEmpty) {
            // print('Product ${product.id} has empty thumbnail');
            return false;
          }
          if (product.price <= 0) {
            // print('Product ${product.id} has invalid price: ${product.price}');
            return false;
          }
          return true;
        } catch (e) {
          // print('Error validating product ${product.id}: $e');
          return false;
        }
      }).toList();

      // print('Found ${validProducts.length} valid products');

      // Cập nhật danh sách sản phẩm
      featuredProducts.assignAll(validProducts);
      // print(
      //     'Updated featuredProducts list with ${featuredProducts.length} items');
    } catch (e) {
      // print('Error in fetchFeaturedProducts: $e');
      TLoaders.errorSnackBar(
          title: 'Error',
          message: 'Failed to load products. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      // Lấy sản phẩm từ repository
      final products = await productRepository.getFeaturedProducts();
      return products;
    } catch (e) {
      // print('Error in fetchFeaturedProducts: $e');
      TLoaders.errorSnackBar(
          title: 'Error',
          message: 'Failed to load products. Please try again.');
      return [];
    }
  }

  /// Get the product price or price range for variations.
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    /// IF no variations exist, return the simple price or sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      /// Calculate the smallest and largest prices among variations
      for (var variation in product.productVariants!) {
        /// Determine the price to consider (sale price if available, otherwise regular price)
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        /// Update smallest and largest prices
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      /// IF smallest and largest prices are the same, return a single price
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        /// Otherwise, return a price range
        return '\$$smallestPrice - \$$largestPrice';
      }
    }
  }

  String? calculateDiscountPercentage(double originalPrice, double salePrice) {
    if (salePrice == 0) return null;
    if (originalPrice == 0) return null;
    double discountPercentage =
        ((originalPrice - salePrice) / originalPrice) * 100;
    return discountPercentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
