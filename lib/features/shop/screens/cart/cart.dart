import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/features/shop/controllers/cart_controller.dart';
import 'package:thuctapcoso/features/shop/screens/cart/widget/cart_items.dart';
import 'package:thuctapcoso/features/shop/screens/checkout/checkout.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              controller.clearCart();
              Get.snackbar(
                'Success',
                'Cart cleared',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.shopping_cart_outlined, size: 80),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(
                  'Your cart is empty',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                ElevatedButton(
                  onPressed: () => Get.back(),
                  child: const Text('Continue Shopping'),
                ),
              ],
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: TCartItems(),
        );
      }),
      bottomNavigationBar: Obx(() {
        if (controller.cartItems.isEmpty) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: Text(
                'Checkout \$${controller.totalCartPrice.value.toStringAsFixed(2)}'),
          ),
        );
      }),
    );
  }
}
