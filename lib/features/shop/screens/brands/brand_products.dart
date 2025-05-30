import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/common/widgets/brands/brand_card.dart';
import 'package:thuctapcoso/common/widgets/products/sortable/sortable_products.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Nike'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              const TBrandCard(showBorder: true),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Sortable Products
              const TSoretableProducts(products: []),
            ],
          ),
        ),
      ),
    );
  }
}