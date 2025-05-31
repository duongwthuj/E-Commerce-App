import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/images/t_round_image.dart';
import 'package:thuctapcoso/common/widgets/texts/product_text.dart';
import 'package:thuctapcoso/common/widgets/texts/t_brand_tittle_text_with_verified_icon.dart';
import 'package:thuctapcoso/features/shop/models/cart_item_model.dart';
import 'package:thuctapcoso/utlis/constants/colors.dart';
import 'package:thuctapcoso/utlis/constants/image_strings.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import 'package:thuctapcoso/utlis/helpers/helper_functions.dart';

// ignore: use_key_in_widget_constructors
class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        TRoundedImage(
          imageUrl: cartItem.image ?? TImages.productImage1,
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
              TBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(
                child: TProductTittleText(
                  title: cartItem.title,
                  maxLines: 1,
                ),
              ),

              /// Attributes
              if (cartItem.selectedVariation != null)
                Text.rich(
                  TextSpan(
                    children: [
                      if (cartItem.selectedVariation!['color'] != null) ...[
                        TextSpan(
                            text: 'Color ',
                            style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(
                            text: '${cartItem.selectedVariation!['color']} ',
                            style: Theme.of(context).textTheme.bodyLarge),
                      ],
                      if (cartItem.selectedVariation!['size'] != null) ...[
                        TextSpan(
                            text: 'Size ',
                            style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(
                            text: '${cartItem.selectedVariation!['size']} ',
                            style: Theme.of(context).textTheme.bodyLarge),
                      ],
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
