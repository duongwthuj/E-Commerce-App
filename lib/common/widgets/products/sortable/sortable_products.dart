import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/layouts/grid_layout.dart';
import 'package:thuctapcoso/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:thuctapcoso/features/shop/models/product_model.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';

class TSoretableProducts extends StatelessWidget {
  const TSoretableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// DropdownButtonFormField
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Icons.sort)),
          onChanged: (value) {},
          items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity']
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),

        /// Products
        const SizedBox(height: TSizes.spaceBtwSections),
        TGridLayout(itemCount: 4, itemBuilder: (_, index) => TProductCardVertical(product: ProductModel.empty())),
      ],
    );
  }
}