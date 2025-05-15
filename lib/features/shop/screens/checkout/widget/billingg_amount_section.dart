import 'package:flutter/material.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
       children: [

        // -- Subtotal
        Row(
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$256.0', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        // -- Shipping
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$256.0', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        
        // Tax fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$256.0', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        // order total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order total', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$256.0', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),

       ],
    );
  }
}