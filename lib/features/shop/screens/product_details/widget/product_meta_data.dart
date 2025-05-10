import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/custom_shapes/containers/round_container.dart';
import 'package:thuctapcoso/common/widgets/images/t_circular_image.dart';
import 'package:thuctapcoso/common/widgets/products/product_cards/prodcut_price_text.dart';
import 'package:thuctapcoso/common/widgets/texts/product_text.dart';
import 'package:thuctapcoso/common/widgets/texts/t_brand_tittle_text_with_verified_icon.dart';
import 'package:thuctapcoso/utlis/constants/enums.dart';

import '../../../../../utlis/constants/colors.dart';
import '../../../../../utlis/constants/image_strings.dart';
import '../../../../../utlis/constants/sizes.dart';
import '../../../../../utlis/helpers/helpFunction.dart';



class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price & sale
        Row(
          children: [

            // sale tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondaryColor.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                vertical: TSizes.xs,
                horizontal: TSizes.sm,
              ),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),

            // Price
            Text("\$ 100.00", style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: TSizes.spaceBtwItems),
            const TProductPriceText(price: '175', isLarge: true,)
          ],

        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        // Title
        const TProductTittleText(title: "Green Nike Sport Shoes"),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),


        // Stock Status
        Row(
          children: [
            const TProductTittleText(title: "status"),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text("In Stock", style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        
        // Brand
        Row(
          children: [
            TCircularImage(
                image: TImages.cosmeticsIcon,
                width: 32,
                height: 32,
                overlayColor: dark ? TColors.white : TColors.black,
            ),
            const TBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSizes: TextSizes.medium,),
          ],
        )
      ]
    );
  }
}
