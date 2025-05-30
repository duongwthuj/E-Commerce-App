import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:thuctapcoso/common/widgets/layouts/grid_layout.dart';
import 'package:thuctapcoso/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:thuctapcoso/features/shop/controllers/category_controller.dart';
import 'package:thuctapcoso/features/shop/models/category_model.dart';
import 'package:thuctapcoso/features/shop/models/product_model.dart';
import 'package:thuctapcoso/features/shop/screens/all_products/all_products.dart';
import 'package:thuctapcoso/features/shop/screens/store/category/category_brands.dart';
import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../common/widgets/texts/sectionsHeading.dart';
import '../../../../../utlis/constants/image_strings.dart';
import '../../../../../utlis/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      // shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    CategoryBrands(category: category),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    FutureBuilder<List<ProductModel>>(
                        future: controller.getCategoryProducts(
                            categoryId: category.id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          }

                          if (!snapshot.hasData ||
                              snapshot.data == null ||
                              snapshot.data!.isEmpty) {
                            return const Center(
                              child:
                                  Text('No products found for this category'),
                            );
                          }

                          return Column(
                            children: [
                              TSectionsHeading(
                                title: 'You might like',
                                onPressed: () => Get.to(() => AllProducts(
                                      title: category.name,
                                      futureMethod:
                                          controller.getCategoryProducts(
                                              categoryId: category.id,
                                              limit: -1),
                                    )),
                              ),
                              const SizedBox(height: TSizes.spaceBtwItems / 2),
                              TGridLayout(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (_, index) => TProductCardVertical(
                                  product: snapshot.data![index],
                                ),
                              ),
                            ],
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
