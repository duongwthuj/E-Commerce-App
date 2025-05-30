  import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:thuctapcoso/common/widgets/images/cached_network_image.dart';
import 'package:thuctapcoso/common/widgets/shimmer/shimmer.dart';
  import 'package:thuctapcoso/features/shop/models/brand_model.dart';
import 'package:thuctapcoso/features/shop/screens/brands/brand_products.dart';
  import '../../../utlis/constants/colors.dart';
  import '../../../utlis/constants/sizes.dart';
  import '../../../utlis/helpers/helpFunction.dart';
  import '../custom_shapes/containers/round_container.dart';
  import 'brand_card.dart';

  class TBrandShowCase extends StatelessWidget {
    const TBrandShowCase({
      super.key, required this.images, required this.brand,
    });

    final List<String> images;
    final BrandModel brand;
    @override
    Widget build(BuildContext context) {
      return InkWell(
        onTap: () => Get.to(() => BrandProducts(brand: brand)),
        child: TRoundedContainer(
            showBorder: true,
            borderColor: TColors.darkerGrey,
            backgroundColor: Colors.transparent,
            margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
            child: Column(
              children: [
                TBrandCard(
                  showBorder: false,
                  brand: brand,
                ),
                Row(
                  children: images.map((image) => brandTopProuctDuctImageWidget(image, context)).toList(),
                )
              ],
            )
        ),
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
            child: CacheNetworkImage(
              fit: BoxFit.contain,
              image: image,
              progressIndicatorBuilder: TShimmerEffect(width: 100, height: 100),
              errorWidget: const Icon(Icons.error),
            )
        ),
      );
    }
  }