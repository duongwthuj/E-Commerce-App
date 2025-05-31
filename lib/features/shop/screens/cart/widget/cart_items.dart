import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/products/cart/add_remove_button.dart';
import 'package:thuctapcoso/common/widgets/products/cart/cart_item.dart';
import 'package:thuctapcoso/common/widgets/products/product_cards/prodcut_price_text.dart';
import 'package:thuctapcoso/features/shop/controllers/cart_controller.dart';
import 'package:thuctapcoso/features/shop/models/cart_item_model.dart';
import 'package:thuctapcoso/features/shop/screens/cart/widget/t_product_quantity_with_add_remove_button.dart';
import 'package:thuctapcoso/utils/constants/colors.dart';
import 'package:thuctapcoso/utils/constants/sizes.dart';
import 'package:thuctapcoso/utils/helpers/helper_functions.dart';
import 'package:thuctapcoso/common/widgets/images/cached_network_image.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final cartItems = cartController.cartItems;

    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: cartItems.length,
        separatorBuilder: (_, __) =>
            const SizedBox(height: TSizes.spaceBtwItems),
        itemBuilder: (_, index) {
          final item = cartItems[index];
          return Column(
            children: [
              TCartItem(
                cartItem: item,
                showAddRemoveButtons: showAddRemoveButtons,
              ),
              if (index != cartItems.length - 1) const Divider(),
            ],
          );
        },
      ),
    );
  }
}

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    required this.cartItem,
    this.showAddRemoveButtons = true,
  });

  final CartItemModel cartItem;
  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        // Image
        SizedBox(
          width: 60,
          height: 60,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: dark ? TColors.darkerGrey : TColors.light,
                borderRadius: BorderRadius.circular(TSizes.sm),
              ),
              child: cartItem.image != null
                  ? CacheNetworkImage(
                      image: cartItem.image!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    )
                  : const Icon(Icons.image),
            ),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        // Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartItem.title,
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Text(
                '\$${cartItem.price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              if (cartItem.selectedVariation != null) ...[
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                Text(
                  cartItem.selectedVariation!.entries
                      .map((e) => '${e.key}: ${e.value}')
                      .join(', '),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ],
          ),
        ),

        // Quantity
        if (showAddRemoveButtons)
          TProductQuantityWithAddRemoveButton(
            quantity: cartItem.quantity,
            add: () {
              if (cartItem.quantity < cartItem.stock) {
                cartController.updateQuantity(
                  cartController.cartItems.indexOf(cartItem),
                  cartItem.quantity + 1,
                );
              } else {
                Get.snackbar(
                  'Error',
                  'Cannot add more. Only ${cartItem.stock} items available.',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              }
            },
            remove: () {
              if (cartItem.quantity > 1) {
                cartController.updateQuantity(
                  cartController.cartItems.indexOf(cartItem),
                  cartItem.quantity - 1,
                );
              } else {
                cartController.removeFromCart(
                  cartController.cartItems.indexOf(cartItem),
                );
              }
            },
          ),
      ],
    );
  }
}
