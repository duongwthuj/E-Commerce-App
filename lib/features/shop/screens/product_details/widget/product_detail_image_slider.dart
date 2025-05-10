import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../../common/widgets/images/t_round_image.dart';
import '../../../../../utlis/constants/colors.dart';
import '../../../../../utlis/constants/image_strings.dart';
import '../../../../../utlis/constants/sizes.dart';
import '../../../../../utlis/helpers/helpFunction.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return CurvedEdgeWidget(
        child: Container(
            color: dark ? TColors.darkerGrey : TColors.light,
            child: Stack(
                children:[
                  // Main large image
                  SizedBox(height : 400, child: Padding(
                    padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                    child: Center(child: Image(image: AssetImage(TImages.productImage1))),
                  )),

                  // image Slider
                  Positioned(
                    right: 0,
                    bottom: 30,
                    left: TSizes.defaultSpace,
                    child: SizedBox(
                      height: 80,
                      child: ListView.separated(
                          separatorBuilder: (_,__) => const SizedBox(width: TSizes.spaceBtwItems),
                          itemCount: 4,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (_, index) =>
                              TRoundedImage(
                                imageUrl: TImages.productImage2,
                                // applyImageRadius: true,
                                border: Border.all(color: TColors.primary),
                                width: 80,
                                padding: const EdgeInsets.all(TSizes.sm),
                                backgroundColor: dark ? TColors.darkerGrey : TColors.light,
                              )
                      ),
                    ),
                  ),

                  // appBar Icon
                  TAppBar(
                      showBackArrow: true,
                      actions: [
                        TCircularIcon(icon: Icons.favorite, color: Colors.red, size: TSizes.iconSm * 1.5, backgroundColor: dark ? TColors.darkerGrey : TColors.light,)
                      ]
                  )
                ]

            )

        ));
  }
}