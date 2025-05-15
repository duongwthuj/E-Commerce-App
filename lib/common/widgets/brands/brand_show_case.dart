import 'package:flutter/material.dart';
import '../../../utlis/constants/colors.dart';
import '../../../utlis/constants/sizes.dart';
import '../../../utlis/helpers/helpFunction.dart';
import '../custom_shapes/containers/round_container.dart';
import 'brand_card.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key, required this.images,
  });

  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
        showBorder: true,
        borderColor: TColors.darkerGrey,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Column(
          children: [
            const TBrandCard(
              showBorder: false,
            ),
            Row (
              children: images.map((image) => brandTopProuctDuctImageWidget(image, context)).toList(),
            )
          ],
        )
    );
  }
  Widget brandTopProuctDuctImageWidget(String image, context){
    return Expanded(
      child: TRoundedContainer(
          height: 100,
          backgroundColor: THelperFunction.isDarkMode(context)
              ? TColors.black
              : TColors.white,
          margin: const EdgeInsets.only(right: TSizes.sm),
          padding: const EdgeInsets.all(TSizes.md),
          child: Image(fit: BoxFit.contain, image: AssetImage(image))
      ),
    );
  }
}