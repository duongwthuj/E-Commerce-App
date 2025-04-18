import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/texts/t_brand_tittle_text.dart';

import '../../../utlis/constants/colors.dart';
import '../../../utlis/constants/enums.dart';
import '../../../utlis/constants/sizes.dart';

class TBrandTitleWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = TColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSizes = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TBrandTitleText(
            title: title,
            maxLines: maxLines,
            color: textColor,
            textAlign: textAlign,
            brandTextSizes: brandTextSizes,
            ),
        ),
        const SizedBox(width: TSizes.xs),
        Icon(Icons.verified, color: iconColor, size: TSizes.iconXs),
      ],
    );
  }
}

