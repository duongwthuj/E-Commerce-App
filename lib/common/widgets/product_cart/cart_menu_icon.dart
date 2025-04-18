import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utlis/constants/colors.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key, this.IconColor, required this.onPressed,
  });

  final Color? IconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    bool dark = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      children: [
        IconButton(onPressed: onPressed, icon: Icon(Icons.shopping_cart, color: dark? TColors.white : TColors.darkerGrey,)),
        Positioned(
          right: 0,
          child: Container (
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: TColors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .apply(color: TColors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
