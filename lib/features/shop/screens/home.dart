import 'package:flutter/material.dart';
import 'package:thuctapcoso/features/shop/screens/widgets/home_appbar.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import 'package:thuctapcoso/utlis/helpers/helpFunction.dart';
import '../../../common/widgets/custom_shapes/containers/primary_hearder_container.dart';
import '../../../common/widgets/custom_shapes/containers/search_container.dart';

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


                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  // search bar
                  TSearchContainer(text: 'Search for products')
                  // Categories
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}






