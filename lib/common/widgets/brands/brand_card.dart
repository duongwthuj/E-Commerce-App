import 'package:flutter/material.dart';
import 'package:thuctapcoso/features/shop/models/brand_model.dart';
import '../../../utlis/constants/enums.dart';
import '../../../utlis/constants/image_strings.dart';
import '../../../utlis/constants/sizes.dart';
import '../../../utlis/helpers/helpFunction.dart';
import '../custom_shapes/containers/round_container.dart';
import '../images/t_circular_image.dart';
import '../texts/t_brand_tittle_text_with_verified_icon.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key, required this.showBorder, this.onTap, required this.brand,
  });

  final bool showBorder;
  final void Function()? onTap;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
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
                image: brand.image,
                isNetworkImage: true,
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
                    TBrandTitleWithVerifiedIcon(
                        title: brand.name,
                        brandTextSizes:
                        TextSizes.large),
                    Text(
                      '${brand.productCount} products',
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