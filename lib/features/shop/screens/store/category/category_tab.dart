import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/layouts/grid_layout.dart';
import 'package:thuctapcoso/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:thuctapcoso/features/shop/models/category_model.dart';
import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../common/widgets/texts/sectionsHeading.dart';
import '../../../../../utlis/constants/image_strings.dart';
import '../../../../../utlis/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key, required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      // shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    const TBrandShowCase(images: [TImages.nikeLogo, TImages.adidasLogo, TImages.pumaLogo]),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    TSectionsHeading(
                      title: 'You might like',
                      onPressed: () {},
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    TGridLayout(
                      itemCount: 4,
                      itemBuilder: (_, index) => const TProductCardVertical(),
                    ),
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