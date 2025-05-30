import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/features/shop/screens/cart/cart.dart';
import '../../../utlis/constants/colors.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key, this.iconColor, required this.onPressed,
  }); 

  final Color? iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    bool dark = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      children: [
        IconButton(onPressed: () => Get.to(() => CartScreen()), icon: Icon(Icons.shopping_cart, color: dark? TColors.white : TColors.darkerGrey,)),
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
