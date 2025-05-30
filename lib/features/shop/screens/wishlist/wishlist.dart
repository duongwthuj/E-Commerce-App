import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/common/widgets/layouts/grid_layout.dart';
import 'package:thuctapcoso/features/shop/models/product_model.dart';
import 'package:thuctapcoso/features/shop/controllers/favorite_controller.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import 'package:thuctapcoso/utlis/constants/text_strings.dart';
import '../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../navigation_menu.dart';


class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Khởi tạo FavoriteController
    final FavoriteController favoriteController = Get.put(FavoriteController());

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          TTexts.favourites,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Icons.add,
            onPressed: () {
              final navController = Get.find<NavigationController>();
              navController.selectedIndex.value = 0; // Chuyển về màn hình chính
            },
            color: Theme.of(context).iconTheme.color,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(() {
            // Kiểm tra nếu không có sản phẩm yêu thích
            if (favoriteController.favoriteProducts.isEmpty) {
              return const Center(
                child: Text(
                  'No favorites yet',
                  style: TextStyle(fontSize: 16),
                ),
              );
            }

            // Hiển thị danh sách sản phẩm yêu thích
            return TGridLayout(
              itemCount: favoriteController.favoriteProducts.length,
              itemBuilder: (_, index) => TProductCardVertical(
                product: favoriteController.favoriteProducts[index],
              ),
            );
          }),
        ),
      ),
    );
  }
}