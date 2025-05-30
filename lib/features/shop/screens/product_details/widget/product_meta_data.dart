import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/custom_shapes/containers/round_container.dart';
import 'package:thuctapcoso/common/widgets/images/t_circular_image.dart';
import 'package:thuctapcoso/common/widgets/products/product_cards/prodcut_price_text.dart';
import 'package:thuctapcoso/common/widgets/texts/product_text.dart';
import 'package:thuctapcoso/common/widgets/texts/t_brand_tittle_text_with_verified_icon.dart';
import 'package:thuctapcoso/features/shop/controllers/product/product_controller.dart';
import 'package:thuctapcoso/features/shop/models/product_model.dart';
import 'package:thuctapcoso/utlis/constants/enums.dart';
import '../../../../../utlis/constants/colors.dart';
import '../../../../../utlis/constants/image_strings.dart';
import '../../../../../utlis/constants/sizes.dart';
import '../../../../../utlis/helpers/helpFunction.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateDiscountPercentage(
        product.price, product.salePrice);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Price & sale
      Row(
        children: [
          // sale tag
          if (salePercentage != null)
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondaryColor.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                vertical: TSizes.xs,
                horizontal: TSizes.sm,
              ),
              child: Text('$salePercentage% OFF',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.black)),
            ),
          if (salePercentage != null)
            const SizedBox(width: TSizes.spaceBtwItems),

          // Price
          if (product.salePrice > 0) ...[
            Text(
              "\$${product.price.toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.titleSmall!.apply(
                    decoration: TextDecoration.lineThrough,
                    color: TColors.grey,
                  ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            TProductPriceText(
              price: product.salePrice.toStringAsFixed(2),
              isLarge: true,
            ),
          ] else
            TProductPriceText(
              price: product.price.toStringAsFixed(2),
              isLarge: true,
            ),
        ],
      ),
      const SizedBox(height: TSizes.spaceBtwItems / 1.5),
      // Title
      TProductTittleText(title: product.title),
      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

      // Stock Status
      Row(
        children: [
          const TProductTittleText(title: "status"),
          const SizedBox(width: TSizes.spaceBtwItems),
          Text(controller.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium)
        ],
      ),
      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

      // Brand
      Row(
        children: [
          TCircularImage(
            image: product.brand?.image ?? '',
            width: 32,
            height: 32,
            overlayColor: dark ? TColors.white : TColors.black,
          ),
          TBrandTitleWithVerifiedIcon(
            title: product.brand?.name ?? '',
            brandTextSizes: TextSizes.medium,
          ),
        ],
      )
    ]);
  }
}
