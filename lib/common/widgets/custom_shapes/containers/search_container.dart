import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../utlis/constants/colors.dart';
import '../../../../utlis/constants/sizes.dart';
import '../../../../utlis/device/device_utility.dart';
import '../../../../utlis/helpers/helpFunction.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key, required this.text,  this.icon = Icons.search,  this.showBackground = true, this.showBorder = true,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal : TSizes.defaultSpace,
        // vertical : TSizes.sm
      ),
      child: Container (
        width: TDeviceUtils.getScreenHeight(context),
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
            color: showBackground ? dark ? TColors.dark : TColors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: TColors.grey) : null
        ),
        child: Row(
            children:[
              Icon(Icons.search, color: TColors.grey),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text('Search for products',
                  style: Theme.of(context).textTheme.bodySmall!
              ),
            ]
        ),
      ),
    );
  }
}