import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/styles/shadows..dart';
import 'package:thuctapcoso/common/widgets/custom_shapes/containers/round_container.dart';
import 'package:thuctapcoso/common/widgets/icons/t_circular_icon.dart';
import 'package:thuctapcoso/common/widgets/images/t_round_image.dart';
import 'package:thuctapcoso/common/widgets/products/product_cards/prodcut_price_text.dart';
import 'package:thuctapcoso/common/widgets/texts/product_text.dart';
import 'package:thuctapcoso/common/widgets/texts/t_brand_tittle_text_with_verified_icon.dart';
import 'package:thuctapcoso/features/shop/models/product_model.dart';
import 'package:thuctapcoso/features/shop/screens/product_details/Product.dart';
import 'package:thuctapcoso/utlis/constants/colors.dart';
import 'package:thuctapcoso/utlis/constants/image_strings.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import 'package:thuctapcoso/utlis/helpers/helper_functions.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() =>  ProductDetailScreen(product: ProductModel.empty())),
      child: Container(
        width: 310,
        height: 140,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Row(
          children: [
            /// Thumbnail
            TRoundedContainer(
              height: 120,
              width: 120,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// Product Image
                  Center(
                    child: TRoundedImage(
                      imageUrl: TImages.productImage1,
                      applyImageRadius: true,
                      isNetworkImage: true,
                    ),
                  ),

                  /// Sale Tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondaryColor.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '25% off',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),

                  /// Favorite Icon
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(
                        icon: Icons.favorite_border, color: Colors.red),
                  ),
                ],
              ),
            ),

            /// Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title & Brand
                    const TProductTittleText(
                        title: 'Product Title', smallSize: true),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    const TBrandTitleWithVerifiedIcon(title: 'Brand Name'),
                    const Spacer(),

                    /// Price Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Price
                        const Flexible(
                            child: TProductPriceText(price: '256.0')),

                        /// Add to cart Button
                        Container(
                          decoration: const BoxDecoration(
                            color: TColors.dark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSizes.cardRadiusMd),
                              bottomRight:
                                  Radius.circular(TSizes.productImageRadius),
                            ),
                          ),
                          child: const SizedBox(
                            width: 32,
                            height: 32,
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
            ),
          ],
        ),
      ),
    );
  }
}
