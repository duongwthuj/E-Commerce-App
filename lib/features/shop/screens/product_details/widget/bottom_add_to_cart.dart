import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/icons/t_circular_icon.dart';
import 'package:thuctapcoso/features/shop/controllers/cart_controller.dart';
import 'package:thuctapcoso/features/shop/controllers/product/varitation_controller.dart';
import 'package:thuctapcoso/features/shop/models/cart_item_model.dart';
import 'package:thuctapcoso/features/shop/models/product_model.dart';
import 'package:thuctapcoso/utils/helpers/helper_functions.dart';
import 'package:thuctapcoso/utils/constants/colors.dart';
import 'package:thuctapcoso/utils/constants/sizes.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = CartController.instance;
    final variationController = VariationController.instance;
    final quantity = 1.obs;

    // Get stock for selected variation
    int getStockForVariation(Map<String, String>? selectedVariation) {
      if (selectedVariation == null || selectedVariation.isEmpty) {
        return product.stock;
      }

      // Find matching variation in product
      for (var variation in product.productVariants ?? []) {
        bool isMatch = true;
        for (var entry in selectedVariation.entries) {
          if (variation.attributes == null ||
              variation.attributes![entry.key] != entry.value) {
            isMatch = false;
            break;
          }
        }
        if (isMatch) {
          return variation.stock;
        }
      }
      return 0; // No matching variation found
    }

    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
        decoration: BoxDecoration(
          color: dark ? TColors.darkerGrey : TColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(TSizes.cardRadiusLg),
            topRight: Radius.circular(TSizes.cardRadiusLg),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TCircularIcon(
                  icon: Icons.remove,
                  backgroundColor: TColors.darkerGrey,
                  width: 40,
                  height: 40,
                  color: TColors.white,
                  onPressed: () {
                    if (quantity.value > 1) {
                      quantity.value--;
                    }
                  },
                ),
                const SizedBox(width: TSizes.spaceBtwItems),
                Obx(() => Text(quantity.value.toString(),
                    style: Theme.of(context).textTheme.titleSmall)),
                const SizedBox(width: TSizes.spaceBtwItems),
                TCircularIcon(
                  icon: Icons.add,
                  backgroundColor: TColors.darkerGrey,
                  width: 40,
                  height: 40,
                  color: TColors.white,
                  onPressed: () {
                    final selectedVariation =
                        variationController.getSelectedVariation();
                    final variationStock =
                        getStockForVariation(selectedVariation);
                    if (quantity.value < variationStock) {
                      quantity.value++;
                    } else {
                      Get.snackbar(
                        'Error',
                        'Cannot add more. Only $variationStock items available for selected variation.',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                final selectedVariation =
                    variationController.getSelectedVariation();
                final cartItem = CartItemModel(
                  productId: product.id,
                  title: product.title,
                  price: product.price,
                  image: product.thumbnail,
                  quantity: quantity.value,
                  selectedVariation: selectedVariation,
                  stock: getStockForVariation(selectedVariation),
                  brandName: product.brand?.name,
                );
                controller.addToCart(cartItem, product);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: TColors.black,
                side: const BorderSide(color: TColors.black),
              ),
              child: const Text('Add to Cart'),
            )
          ],
        ));
  }
}
