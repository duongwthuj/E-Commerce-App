import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/features/shop/screens/sub_category/sub_categories.dart';
import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utlis/constants/image_strings.dart';


class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () => Get.to(() => const SubCategoriesScreen()),
              child: Stack(
                children: [
                  TVerticalImageText(
                      image: TImages.clothIcon,
                      title: 'Cloth',
                      onTap: () => Get.to(() => const SubCategoriesScreen())),
                ],
              ),
            );
          }),
    );
  }
}
