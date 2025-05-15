
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../navigation_menu.dart';
import '../../../../utlis/constants/sizes.dart';
import '../../../../utlis/constants/text_strings.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TAppBar(
          title: Text(TTexts.popularProducts,
              style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            TCircularIcon(
              icon: Icons.add,
              onPressed: () {
                final navController = Get.find<NavigationController>();
                navController.selectedIndex.value = 0;
              },
              color: Theme.of(context).iconTheme.color,
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    TGridLayout(
                        itemCount: 6,
                        itemBuilder: (_, index) =>
                            const TProductCardVertical()),
                  ],
                ))));
  }
}
