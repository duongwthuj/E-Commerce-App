import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/common/widgets/brands/brand_card.dart';
import 'package:thuctapcoso/common/widgets/layouts/grid_layout.dart';
import 'package:thuctapcoso/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:thuctapcoso/common/widgets/texts/sectionsHeading.dart';
import 'package:thuctapcoso/features/shop/controllers/brand_controller.dart';
import 'package:thuctapcoso/features/shop/models/brand_model.dart';
import 'package:thuctapcoso/features/shop/screens/brands/brand_products.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const TAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const TSectionsHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// -- Brands
              Obx(() {
                if (brandController.isLoading.value) {
                  return const TVerticalProductShimmer();
                }
                return TGridLayout(
                  itemCount: brandController.allBrands.length,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) => TBrandCard(
                    showBorder: true,
                    onTap: () => Get.to(() => BrandProducts(brand: brandController.allBrands[index])), 
                    brand: brandController.allBrands[index],

                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
