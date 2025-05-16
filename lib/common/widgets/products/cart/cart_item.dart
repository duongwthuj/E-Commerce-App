import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/images/t_round_image.dart';
import 'package:thuctapcoso/common/widgets/texts/product_text.dart';
import 'package:thuctapcoso/common/widgets/texts/t_brand_tittle_text_with_verified_icon.dart';
import 'package:thuctapcoso/utlis/constants/colors.dart';
import 'package:thuctapcoso/utlis/constants/image_strings.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import 'package:thuctapcoso/utlis/helpers/helper_functions.dart';

// ignore: use_key_in_widget_constructors
class TCartItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        TRoundedImage(
          imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkGrey
              : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        /// Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(
                child: TProductTittleText(
                  title:
                      'Black Sports shoes sdbdk pdbskaj bsdfik dbsj',
                  maxLines: 1,
                ),
              ),

              /// Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Color ',
                        style:
                            Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'Green ',
                        style:
                            Theme.of(context).textTheme.bodyLarge),

                    TextSpan(
                        text: 'Size ',
                        style:
                            Theme.of(context).textTheme.bodySmall),

                    TextSpan(
                        text: '40 ',
                        style:
                            Theme.of(context).textTheme.bodyLarge),

                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
