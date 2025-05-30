import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/common/widgets/appbar/tabbar.dart';
import 'package:thuctapcoso/common/widgets/brands/brand_card.dart';
import 'package:thuctapcoso/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:thuctapcoso/common/widgets/layouts/grid_layout.dart';
import 'package:thuctapcoso/common/widgets/product_cart/cart_menu_icon.dart';
import 'package:thuctapcoso/common/widgets/texts/sectionsHeading.dart';
import 'package:thuctapcoso/features/shop/screens/brands/all_brands.dart';
import 'package:thuctapcoso/features/shop/screens/store/category/category_tab.dart';
import 'package:thuctapcoso/features/shop/controllers/category_controller.dart';
import 'package:thuctapcoso/utlis/helpers/helpFunction.dart';
import '../../../../utlis/constants/sizes.dart';

class Store extends StatelessWidget {
  const Store({super.key});
  // get tabs => null;

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          showBackArrow: false,
          title: const Text('Store'),
          actions: [
            TCartCounterIcon(
              onPressed: () {},
              iconColor: Colors.white,
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
                            onPressed: () => Get.to(() => const AllBrandsScreen()),
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
                  bottom: TTabBar(
                    tabs: categories.map((category) => Tab(text: category.name)).toList(),
                  ),
                ),
              ];
            },
            body: TabBarView(children: 
            categories.map((category) => TCategoryTab(category: category)).toList(),
            )),
      ),
    );
  }
}
