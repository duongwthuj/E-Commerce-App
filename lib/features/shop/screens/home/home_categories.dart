import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/shimmer/category_shimmer.dart';
import 'package:thuctapcoso/features/shop/controllers/category_controller.dart';
import 'package:thuctapcoso/features/shop/screens/sub_category/sub_categories.dart';
import 'package:thuctapcoso/utlis/constants/colors.dart';
import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utlis/constants/image_strings.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) {
        return const TCategoryShimmer();
      }

      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No categories found',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: TColors.white),
          ),
        );
      }
      return SizedBox(
        height: 90,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return GestureDetector(
                onTap: () => Get.to(() => const SubCategoriesScreen()),
                child: TVerticalImageText(
                  image: category.image,
                  title: category.name,
                  onTap: () => Get.to(() => const SubCategoriesScreen()),
                ),
              );
            }),
      );
    });
  }
}
