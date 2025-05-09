import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/common/widgets/appbar/tabbar.dart';
import 'package:thuctapcoso/common/widgets/brands/brand_card.dart';
import 'package:thuctapcoso/common/widgets/custom_shapes/containers/round_container.dart';
import 'package:thuctapcoso/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:thuctapcoso/common/widgets/layouts/grid_layout.dart';
import 'package:thuctapcoso/common/widgets/product_cart/cart_menu_icon.dart';
import 'package:thuctapcoso/common/widgets/texts/sectionsHeading.dart';
import 'package:thuctapcoso/features/shop/screens/store/category/category_tab.dart';
import 'package:thuctapcoso/utlis/constants/image_strings.dart';
import 'package:thuctapcoso/utlis/helpers/helpFunction.dart';
import '../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../utlis/constants/colors.dart';
import '../../../../utlis/constants/sizes.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  // get tabs => null;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      const TCategoryTab(),
      const TCategoryTab(),
      const TCategoryTab(),
      const TCategoryTab(),
      const TCategoryTab(),
    ];
    return DefaultTabController(
      length: 5,
      child: Scaffold(
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
        body:  NestedScrollView  (
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  floating: true,
                  snap: true,
                  pinned: true,
                  automaticallyImplyLeading: false,
                  backgroundColor: THelperFunction.isDarkMode(context)
                      ? Colors.black
                      : Colors.white,
                  expandedHeight: 355,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          // Search bar
                          const SizedBox(height: TSizes.spaceBtwItems),
                          TSearchContainer(
                            text: 'Search in Store',
                            showBorder: true,
                          ),
                          const SizedBox(height: TSizes.spaceBtwSections),

                          // Featured Products
                          TSectionsHeading(
                            title: 'Featured Products',
                            showActionButton: true,
                            onPressed: () {},
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems / 2),

                          // Brands grid
                          TGridLayout(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              return const TBrandCard(showBorder: true);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  bottom: const TTabBar(
                    tabs: [
                      Tab(text: 'All'),
                      Tab(text: 'Clothes'),
                      Tab(text: 'Shoes'),
                      Tab(text: 'Accessories'),
                      Tab(text: 'Bags'),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(children: [

              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
            ])),
      ),
    );
  }
}
