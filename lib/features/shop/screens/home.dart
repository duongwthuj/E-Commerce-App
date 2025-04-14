import 'package:flutter/material.dart';
import 'package:thuctapcoso/features/shop/screens/widgets/home_appbar.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import '../../../common/widgets/custom_shapes/containers/primary_hearder_container.dart';
import '../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../common/widgets/texts/sectionsHeading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  // appBar
                  THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // search bar
                  TSearchContainer(text: 'Search for products'),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column (
                      children:[
                        // Heading
                        TSectionsHeading(title: 'Popular Categories', showActionButton: false),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        // Categories List


                      ]
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}







