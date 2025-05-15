import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/products/cart/add_remove_button.dart';
import 'package:thuctapcoso/common/widgets/products/cart/cart_item.dart';
import 'package:thuctapcoso/common/widgets/products/product_cards/prodcut_price_text.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
          const SizedBox(height: TSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          TCartItem(),
          if (showAddRemoveButton) SizedBox(height: TSizes.spaceBtwItems),
          if (showAddRemoveButton)
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
    );
  }
}
