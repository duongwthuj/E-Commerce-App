import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/styles/shadows..dart';
import 'package:thuctapcoso/common/widgets/custom_shapes/containers/round_container.dart';
import 'package:thuctapcoso/common/widgets/products/product_cards/prodcut_price_text.dart';
import 'package:thuctapcoso/features/shop/controllers/product/product_controller.dart';
import 'package:thuctapcoso/features/shop/controllers/favorite_controller.dart';
import 'package:thuctapcoso/features/shop/models/product_model.dart';
import 'package:thuctapcoso/utlis/helpers/helpFunction.dart';
import '../../../../features/shop/screens/product_details/Product.dart';
import '../../../../utlis/constants/colors.dart';
import '../../../../utlis/constants/sizes.dart';
import '../../icons/t_circular_icon.dart';
import '../../images/t_round_image.dart';
import '../../texts/product_text.dart';
import '../../texts/t_brand_tittle_text_with_verified_icon.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final controller = ProductController.instance;
    final favoriteController = Get.put(FavoriteController());
    final salePercentage = controller.calculateDiscountPercentage(
        product.price, product.salePrice);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [
            TShadowStyle.verticalProductShadow,
          ],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.darkGrey : TColors.white,
              child: Stack(
                children: [
                  // Product image
                  TRoundedImage(
                      imageUrl: product.thumbnail, applyImageRadius: true),

                  // Sale tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondaryColor.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                        vertical: TSizes.xs,
                        horizontal: TSizes.sm,
                      ),
                      child: Text(
                        salePercentage != null ? '$salePercentage% off' : '',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),

                  // favorite iconbutton
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Obx(() {
                      final isFavorite = favoriteController.isFavorite(product);
                      return TCircularIcon(
                        icon:
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                        width: TSizes.iconSm,
                        color: isFavorite ? Colors.red : Colors.grey,
                        size: TSizes.iconSm,
                        backgroundColor: Colors.transparent,
                        onPressed: () {
                          if (isFavorite) {
                            favoriteController.removeFromFavorites(product);
                          } else {
                            favoriteController.addToFavorites(product);
                          }
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),

            // Details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.xs),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTittleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  TBrandTitleWithVerifiedIcon(title: product.brand!.name),
                ],
              ),
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (product.salePrice > 0) ...[
                        Padding(
                          padding: const EdgeInsets.only(left: TSizes.xs),
                          child: Text(
                            "\$${product.price.toStringAsFixed(2)}",
                            style:
                                Theme.of(context).textTheme.labelMedium!.apply(
                                      decoration: TextDecoration.lineThrough,
                                      color: TColors.grey,
                                    ),
                          ),
                        ),
                        const SizedBox(height: TSizes.xs),
                        Padding(
                          padding: const EdgeInsets.only(left: TSizes.xs),
                          child: TProductPriceText(
                            price: product.salePrice.toStringAsFixed(2),
                            isLarge: true,
                          ),
                        ),
                      ] else
                        Padding(
                          padding: const EdgeInsets.only(left: TSizes.xs),
                          child: TProductPriceText(
                            price: product.price.toStringAsFixed(2),
                            isLarge: true,
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.sm),
                      bottomLeft: Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: SizedBox(
                    width: TSizes.iconLg * 1.2,
                    height: TSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(Icons.add, color: TColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
