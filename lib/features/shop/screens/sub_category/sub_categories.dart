import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/common/widgets/images/t_round_image.dart';
import 'package:thuctapcoso/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:thuctapcoso/common/widgets/texts/sectionsHeading.dart';
import 'package:thuctapcoso/features/shop/controllers/category_controller.dart';
import 'package:thuctapcoso/features/shop/models/category_model.dart';
import 'package:thuctapcoso/features/shop/screens/all_products/all_products.dart';
import 'package:thuctapcoso/utlis/constants/image_strings.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text(category.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const TRoundedImage(
                width: double.infinity,
                imageUrl: TImages.promoBanner1,
                applyImageRadius: true,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Sub-Categories
              FutureBuilder(
                  future: controller.getSubCategoryProducts(
                      categoryId: category.id),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
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
                        child: Text('No sub-categories found'),
                      );
                    }

                    final subCategories = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final subCategory = subCategories[index];
                        return FutureBuilder(
                            future: controller.getCategoryProducts(
                                categoryId: subCategory.id, limit: -1),
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
                                return const SizedBox.shrink();
                              }

                              return Column(
                                children: [
                                  TSectionsHeading(
                                    title: subCategory.name,
                                    onPressed: () => Get.to(() => AllProducts(
                                          title: subCategory.name,
                                          futureMethod:
                                              controller.getCategoryProducts(
                                                  categoryId: subCategory.id,
                                                  limit: -1),
                                        )),
                                  ),
                                  const SizedBox(height: TSizes.spaceBtwItems),
                                  SizedBox(
                                    height: 140,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.data!.length,
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                              width: TSizes.spaceBtwItems),
                                      itemBuilder: (context, index) =>
                                          TProductCardHorizontal(
                                              product: snapshot.data![index]),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
