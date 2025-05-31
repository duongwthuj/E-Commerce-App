import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/layouts/grid_layout.dart';
import 'package:thuctapcoso/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:thuctapcoso/features/shop/controllers/product/product_controller.dart';
import 'package:thuctapcoso/features/shop/screens/all_products/all_products.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import '../../../../../common/widgets/custom_shapes/containers/primary_hearder_container.dart';
import '../../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../../common/widgets/images/banner_slider.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/texts/sectionsHeading.dart';
import '../../../../../utlis/constants/colors.dart';
import 'home_appbar.dart';
import 'home_categories.dart';
import 'package:thuctapcoso/features/shop/controllers/banner_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  // int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Khởi tạo BannerController
    Get.put(BannerController());
    // Auto-scroll the page view
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted && _pageController.hasClients) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 800),
          curve: Curves.fastOutSlowIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  // appBar
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.defaultSpace),

                  // search bar
                  const TSearchContainer(text: 'Search for products'),
                  const SizedBox(height: TSizes.defaultSpace),

                  // Categories
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(children: [
                      // Heading
                      TSectionsHeading(
                          title: 'Popular Products',
                          onPressed: () => Get.to(() => const AllProducts(
                            title: 'Popular Products', 

                            )
                            ),
                          showActionButton: false,
                          textColor: TColors.white),
                      const SizedBox(height: TSizes.defaultSpace),

                      // Categories List
                      const THomeCategories(),
                      const SizedBox(height: TSizes.defaultSpace),
                    ]),
                  ),
                ],
              ),
            ),
            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(children: [
                TCarouselSlider(),

                TSectionsHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => const AllProducts(title: 'Popular Products'))),

                // const SizedBox(height: TSizes.spaceBtwItems),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const TVerticalProductShimmer();
                  }

                  if (controller.featuredProducts.isEmpty) {
                    return const Center(child: Text('No products found'));
                  }

                  return TGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => TProductCardVertical(
                            product: controller.featuredProducts[index],
                          ));
                })
              ]),
            ),
            // Page indicator
          ],
        ),
      ),
    );
  }
}
