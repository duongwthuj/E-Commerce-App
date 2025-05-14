import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/common/widgets/products/cart/add_remove_button.dart';
import 'package:thuctapcoso/common/widgets/products/cart/cart_item.dart';
import 'package:thuctapcoso/common/widgets/products/product_cards/prodcut_price_text.dart';
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
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) =>
              const SizedBox(height: TSizes.spaceBtwSections),
          itemCount: 10,
          itemBuilder: (_, index) => Column(
            children: [
              TCartItem(),
              SizedBox(height: TSizes.spaceBtwItems),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 70),
                      TProductQuantityWithADdRemoveButton(),
                    ],
                  ),
                  TProductPriceText(price: '256')
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          ElevatedButton(onPressed: () {}, child: Text('Checkout \$256.0')),
    );
  }
}
