import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utlis/constants/enums.dart';
import '../../../utlis/constants/image_strings.dart';
import '../../../utlis/constants/sizes.dart';
import '../../../utlis/helpers/helpFunction.dart';
import '../custom_shapes/containers/round_container.dart';
import '../images/t_circular_image.dart';
import '../texts/t_brand_tittle_text_with_verified_icon.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key, required this.showBorder, this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            // Icon
            Flexible(
              child: TCircularImage(
                image: TImages.clothIcon,
                isNetworkImage: false,
                backgroundColor:
                Colors.transparent,
                overlayColor:
                THelperFunction.isDarkMode(
                    context)
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            const SizedBox(
                width: TSizes.spaceBtwItems / 2),

            // Text
            Expanded(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const TBrandTitleWithVerifiedIcon(
                        title: 'Nike',
                        brandTextSizes:
                        TextSizes.large),
                    Text(
                      '123 products',
                      overflow:
                      TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium,
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}