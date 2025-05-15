import 'package:flutter/material.dart';
import 'package:thuctapcoso/utlis/helpers/helpFunction.dart';

import '../../../utlis/constants/colors.dart';
import '../../../utlis/constants/sizes.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
     this.width, this.height, required this.icon, this.color, this.backgroundColor, this.onPressed, this.size = TSizes.iconXs,
  });

  final double? width, height,size;
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
                ?backgroundColor !
                : THelperFunction.isDarkMode(context)
                    ? TColors.darkGrey
                    : TColors.white,
            borderRadius: BorderRadius.circular(50)
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: color,
            size: size
          ),
        )
    );
  }
}