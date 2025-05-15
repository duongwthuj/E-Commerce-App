
import 'package:flutter/material.dart'; // For Iconsax.sort
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/common/widgets/layouts/grid_layout.dart';
import 'package:thuctapcoso/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:thuctapcoso/common/widgets/products/sortable/sortable_products.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Popular Products'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: TSoretableProducts(),
        ),
      ),
    );
  }
}

