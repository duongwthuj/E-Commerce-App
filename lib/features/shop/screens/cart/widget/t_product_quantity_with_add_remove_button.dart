import 'package:flutter/material.dart';
import 'package:thuctapcoso/utils/constants/colors.dart';
import 'package:thuctapcoso/utils/constants/sizes.dart';

class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddRemoveButton({
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Remove Button
        TCircularIcon(
          icon: Icons.remove,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: Colors.white,
          backgroundColor: TColors.primary,
          onPressed: remove,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text(
          quantity.toString(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        // Add Button
        TCircularIcon(
          icon: Icons.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: Colors.white,
          backgroundColor: TColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = TSizes.lg,
    this.onPressed,
    this.color,
    this.backgroundColor,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!
            : Theme.of(context).brightness == Brightness.dark
                ? TColors.black
                : TColors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: color, size: size),
      ),
    );
  }
}
