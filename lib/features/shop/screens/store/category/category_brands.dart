import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:thuctapcoso/features/shop/models/category_model.dart';
import 'package:thuctapcoso/features/shop/controllers/brand_controller.dart';
import 'package:thuctapcoso/common/widgets/brands/brand_show_case.dart';
import 'package:thuctapcoso/utlis/constants/image_strings.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        // Handle loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Column(
            children: [
              TVerticalProductShimmer(),
              SizedBox(height: TSizes.spaceBtwItems),
            ],
          );
        }

        // Handle error state
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        // Handle empty state
        if (!snapshot.hasData ||
            snapshot.data == null ||
            snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No brands found for this category'),
          );
        }

        final brands = snapshot.data!;

        return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                future:
                    controller.getBrandProducts(brandId: brand.id, limit: 3),
                builder: (context, productSnapshot) {
                  // Show brand showcase even if there are no products
                  return TBrandShowCase(
                    brand: brand,
                    images: productSnapshot.hasData &&
                            productSnapshot.data != null
                        ? productSnapshot.data!.map((e) => e.thumbnail).toList()
                        : [], // Empty list if no products
                  );
                },
              );
            });
      },
    );
  }
}
