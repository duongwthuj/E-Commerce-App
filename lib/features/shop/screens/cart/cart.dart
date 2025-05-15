import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/features/shop/screens/cart/widget/cart_items.dart';
import 'package:thuctapcoso/features/shop/screens/checkout/checkout.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: TCartItems(),
      ),
      bottomNavigationBar:
          ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: Text('Checkout \$256.0')),
    );
  }
}
