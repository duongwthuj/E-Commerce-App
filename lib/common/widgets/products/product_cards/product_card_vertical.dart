import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:thuctapcoso/common/styles/shadows..dart';
import 'package:thuctapcoso/common/widgets/custom_shapes/containers/round_container.dart';
import 'package:thuctapcoso/common/widgets/products/product_cards/prodcut_price_text.dart';
import 'package:thuctapcoso/utlis/helpers/helpFunction.dart';
import '../../../../features/shop/screens/product_details/Product.dart';
import '../../../../utlis/constants/colors.dart';
import '../../../../utlis/constants/image_strings.dart';
import '../../../../utlis/constants/sizes.dart';
import '../../icons/t_circular_icon.dart';
import '../../images/t_round_image.dart';
import '../../texts/product_text.dart';
import '../../texts/t_brand_tittle_text_with_verified_icon.dart';
import '../../../../utlis/constants/text_strings.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetail()),
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
                      imageUrl: TImages.productImage2, applyImageRadius: true),

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
                        '20% off',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),

                  // favorite iconbutton
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: TCircularIcon(
                        icon: Icons.favorite,
                        width: TSizes.iconSm,
                        color: Colors.red,
                        size: TSizes.iconSm ,
                        backgroundColor: Colors.transparent,
                      )),
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
                    title: TTexts.popularProducts,
                    smallSize: true,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  TBrandTitleWithVerifiedIcon(title: TTexts.nike),
                ],
              ),
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: TSizes.xs),
                  child: TProductPriceText(
                    price: '100',
                    isLarge: true,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: TColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.sm),
                        bottomLeft: Radius.circular(TSizes.productImageRadius),
                      )),
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
