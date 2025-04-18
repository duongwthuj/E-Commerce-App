import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/common/widgets/custom_shapes/containers/round_container.dart';
import 'package:thuctapcoso/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:thuctapcoso/common/widgets/layouts/grid_layout.dart';
import 'package:thuctapcoso/common/widgets/product_cart/cart_menu_icon.dart';
import 'package:thuctapcoso/common/widgets/texts/sectionsHeading.dart';
import 'package:thuctapcoso/common/widgets/texts/t_brand_tittle_text_with_verified_icon.dart';
import 'package:thuctapcoso/utlis/helpers/helpFunction.dart';

import '../../../../common/widgets/images/t_circular_image.dart';
import '../../../../utlis/constants/enums.dart';
import '../../../../utlis/constants/image_strings.dart';
import '../../../../utlis/constants/sizes.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: false,
        title: const Text('Store'),
        actions: [
          TCartCounterIcon(
            onPressed: () {},
            IconColor: Colors.white,
          )
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: false,
              pinned: true,
              automaticallyImplyLeading: false,
              backgroundColor: THelperFunction.isDarkMode(context)
                  ? Colors.black
                  : Colors.white,
              expandedHeight: 440,
              flexibleSpace: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    // Search bar
                    SizedBox(height: TSizes.spaceBtwItems),
                    TSearchContainer(text: 'Search in Store', showBorder: true),
                    SizedBox(height: TSizes.spaceBtwSections),

                    // Featured Products
                    TSectionsHeading(title: 'Featured Products', showActionButton: true, onPressed: () {}),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    TGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: TRoundedContainer(
                                padding: const EdgeInsets.all(TSizes.sm),
                                showBorder: true,
                                backgroundColor: Colors.transparent,
                                child: Row(
                                  children: [
                                    // Icon
                                    Flexible(
                                      child: TCircularImage(
                                        image: TImages.clothIcon,
                                        isNetworkImage: false,
                                        backgroundColor: Colors.transparent,
                                        overlayColor: THelperFunction.isDarkMode(context)
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: TSizes.spaceBtwItems / 2),

                                    // Text
                                    Expanded(
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const TBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSizes: TextSizes.large),
                                            Text(
                                              '123 products',
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context).textTheme.labelMedium,
                                            )
                                          ]
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                        }
                        ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(),
      ),
    );
  }
}


