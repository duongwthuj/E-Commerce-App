import 'package:flutter/material.dart';
import '../../../utlis/constants/colors.dart';
import '../../../utlis/constants/sizes.dart';
import 'cached_network_image.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage(
      {super.key,
      this.width,
      this.height,
      required this.imageUrl,
      this.applyImageRadius = false,
      this.border,
      this.backgroundColor,
      this.fit = BoxFit.contain,
      this.padding,
      this.isNetworkImage = true,
      this.onPressed,
      this.borderRadius = TSizes.md});

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: dark ? TColors.darkGrey : TColors.white,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: isNetworkImage
              ? CacheNetworkImage(
                  image: imageUrl,
                  fit: fit,
                  width: width,
                  height: height,
                )
              : Image.asset(
                  imageUrl,
                  fit: fit,
                ),
        ),
      ),
    );
  }
}
