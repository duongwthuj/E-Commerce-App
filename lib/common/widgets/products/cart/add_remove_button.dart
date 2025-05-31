import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/icons/t_circular_icon.dart';
import 'package:thuctapcoso/utlis/constants/colors.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import 'package:thuctapcoso/utlis/helpers/helper_functions.dart';

class TProductQuantityWithADdRemoveButton extends StatelessWidget {
  const TProductQuantityWithADdRemoveButton({
    super.key,
    required this.quantity,
    required this.add,
    required this.remove,
  });

  final int quantity;
  final VoidCallback add;
  final VoidCallback remove;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon: Icons.remove,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: dark ? TColors.white : TColors.black,
          backgroundColor: dark ? TColors.darkGrey : TColors.light,
          onPressed: remove,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text(quantity.toString(),
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(width: TSizes.spaceBtwItems),
        TCircularIcon(
          icon: Icons.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: TColors.white,
          backgroundColor: TColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}
