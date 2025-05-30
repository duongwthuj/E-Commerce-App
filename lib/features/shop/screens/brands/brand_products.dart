import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/common/widgets/brands/brand_card.dart';
import 'package:thuctapcoso/common/widgets/products/sortable/sortable_products.dart';
import 'package:thuctapcoso/features/shop/controllers/brand_controller.dart';
import 'package:thuctapcoso/features/shop/models/brand_model.dart';
import 'package:thuctapcoso/features/shop/models/product_model.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text(brand.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              TBrandCard(showBorder: true, brand: brand),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Sortable Products
              FutureBuilder<List<ProductModel>>(
                  future: BrandController.instance.getBrandProducts(brand.id),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                          child: Text('No products found for this brand'));
                    }

                    return TSoretableProducts(products: snapshot.data!);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
