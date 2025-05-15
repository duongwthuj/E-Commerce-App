import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/layouts/grid_layout.dart';
import 'package:thuctapcoso/utlis/constants/image_strings.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import '../../../../../common/widgets/custom_shapes/containers/primary_hearder_container.dart';
import '../../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../../common/widgets/images/banner_slider.dart';
import '../../../../../common/widgets/images/t_round_image.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/texts/sectionsHeading.dart';
import '../../../../../utlis/constants/colors.dart';
import 'home_appbar.dart';
import 'home_categories.dart';

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
    // Auto-scroll the page view
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PrimaryHeaderContainer(
              child: Column(
                children: [
                  // appBar
                  THomeAppBar(),
                  SizedBox(height: TSizes.defaultSpace),

                  // search bar
                  TSearchContainer(text: 'Search for products'),
                  SizedBox(height: TSizes.defaultSpace),

                  // Categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(children: [
                      // Heading
                      TSectionsHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: TColors.white),
                      SizedBox(height: TSizes.defaultSpace),

                      // Categories List
                      THomeCategories(),
                      SizedBox(height: TSizes.defaultSpace),
                    ]),
                  ),
                ],
              ),
            ),
            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                  children: [
                    TCarouselSlider(
                      items: [
                        TRoundedImage(imageUrl: TImages.promoBanner1),
                        TRoundedImage(imageUrl: TImages.promoBanner2),
                        TRoundedImage(imageUrl: TImages.promoBanner3),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCardVertical())


                  ]
              ),
            ),
            // Page indicator
          ],
        ),
      ),
    );
  }
}


