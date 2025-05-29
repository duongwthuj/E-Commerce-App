import 'package:flutter/material.dart';
import '../../../utlis/constants/colors.dart';
import '../../../utlis/constants/sizes.dart';
import '../../../utlis/helpers/helpFunction.dart';
import '../images/cached_network_image.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(right: TSizes.defaultSpace),
      child: Column(
        children: [
          Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? TColors.dark : TColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                  child: isNetworkImage
                      ? CacheNetworkImage(
                          image: image,
                          width: 56,
                          height: 56,
                          fit: BoxFit.cover,
                        )
                      : Image(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                          color: dark ? TColors.light : TColors.dark))),

          // Text
          const SizedBox(height: TSizes.spaceBtwItems),
          SizedBox(
              width: 40,
              child: Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .apply(color: TColors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}
