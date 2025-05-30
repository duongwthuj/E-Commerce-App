import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/images/cached_network_image.dart';
import 'package:thuctapcoso/features/shop/controllers/product/image_controller.dart';
import 'package:thuctapcoso/features/shop/controllers/favorite_controller.dart';
import 'package:thuctapcoso/features/shop/models/product_model.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../../common/widgets/images/t_round_image.dart';
import '../../../../../utlis/constants/colors.dart';
import '../../../../../utlis/constants/sizes.dart';
import '../../../../../utlis/helpers/helpFunction.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    // Initialize the controllers
    final controller = Get.put(ImageController());
    final favoriteController = Get.put(FavoriteController());
    final images = controller.getAllProductImages(product);

    return CurvedEdgeWidget(
        child: Container(
            color: dark ? TColors.darkerGrey : TColors.light,
            child: Stack(children: [
              // Main large image
              SizedBox(
                  height: 400,
                  child: Padding(
                    padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                    child: Center(child: Obx(() {
                      final image = controller.selectedProductImage.value;
                      return GestureDetector(
                        onTap: () => controller.showEnlargeImage(image),
                        child: CacheNetworkImage(
                          image: image,
                          width: double.infinity,
                          height: 400,
                          fit: BoxFit.contain,
                        ),
                      );
                    })),
                  )),

              // image Slider
              Positioned(
                right: 0,
                bottom: 30,
                left: TSizes.defaultSpace,
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                      separatorBuilder: (_, __) =>
                          const SizedBox(width: TSizes.spaceBtwItems),
                      itemCount: images.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (_, index) => GestureDetector(
                            onTap: () => controller.selectedProductImage.value =
                                images[index],
                            child: TRoundedImage(
                              imageUrl: images[index],
                              border: Border.all(color: TColors.primary),
                              width: 80,
                              padding: const EdgeInsets.all(TSizes.sm),
                              backgroundColor:
                                  dark ? TColors.darkerGrey : TColors.light,
                              isNetworkImage: true,
                            ),
                          )),
                ),
              ),

              // appBar Icon
              TAppBar(showBackArrow: true, actions: [
                Obx(() {
                  final isFavorite = favoriteController.isFavorite(product);
                  return TCircularIcon(
                    icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                    size: TSizes.iconSm * 1.5,
                    backgroundColor: dark ? TColors.darkerGrey : TColors.light,
                    onPressed: () {
                      if (isFavorite) {
                        favoriteController.removeFromFavorites(product);
                      } else {
                        favoriteController.addToFavorites(product);
                      }
                    },
                  );
                }),
              ])
            ])));
  }
}
