import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:thuctapcoso/features/shop/controllers/product/image_controller.dart';
import 'package:thuctapcoso/features/shop/models/product_model.dart';
import 'package:thuctapcoso/features/shop/models/product_variation_model.dart';
import 'package:thuctapcoso/features/shop/models/product_attribute_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  RxMap<String, String> selectedAttributes = <String, String>{}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;
  RxList<ProductAttributeModel> productAttributes =
      <ProductAttributeModel>[].obs;

  void onAttributeSelected(
      ProductModel product, String attributeName, String attributeValue) {
    selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariants!.firstWhere(
      (variation) =>
          _isSameAttributeValues(variation.attributes, selectedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );

    if (selectedVariation.image != null &&
        selectedVariation.image!.isNotEmpty) {
      ImageController.instance.selectedProductImage.value =
          selectedVariation.image!;
    }

    this.selectedVariation.value = selectedVariation;
    getProductVariationStockStatus();
  }

  bool _isSameAttributeValues(Map<String, String> variationAttributes,
      Map<String, String> selectedAttributes) {
    if (variationAttributes.length != selectedAttributes.length) return false;
    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  Set<String> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    final availableValues = variations
        .where((variation) => variation.attributes.containsKey(attributeName))
        .map((variation) => variation.attributes[attributeName]!)
        .toSet();
    print('Available values for $attributeName: $availableValues');
    return availableValues;
  }

  String getVaritationPrice() {
    return (selectedVariation.value.salePrice > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price)
        .toString();
  }

  void getProductVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stock > 0
        ? 'In Stock (${selectedVariation.value.stock})'
        : 'Out of Stock';
    print('Stock status: ${variationStockStatus.value}');
  }

  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }

  // Khởi tạo stock status khi chọn sản phẩm
  void initializeVariation(ProductModel product) {
    resetSelectedAttributes();
    if (product.productVariants != null &&
        product.productVariants!.isNotEmpty) {
      selectedVariation.value = product.productVariants!.first;
      getProductVariationStockStatus();
    }
  }

  // Initialize attributes
  void initializeAttributes(List<ProductAttributeModel> attributes) {
    productAttributes.value = attributes;
    // Set default values
    for (var attribute in attributes) {
      if (attribute.name != null &&
          attribute.values != null &&
          attribute.values!.isNotEmpty) {
        selectedAttributes[attribute.name!] = attribute.values!.first;
      }
    }
  }

  // Update selected attribute
  void updateSelectedAttribute(String attributeName, String value) {
    selectedAttributes[attributeName] = value;
  }

  // Get selected variation
  Map<String, String> getSelectedVariation() {
    return selectedAttributes;
  }

  // Clear selections
  void clearSelections() {
    selectedAttributes.clear();
    productAttributes.clear();
  }
}
