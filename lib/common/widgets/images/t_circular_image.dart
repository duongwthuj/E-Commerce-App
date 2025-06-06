import 'package:flutter/cupertino.dart';
import '../../../utlis/constants/colors.dart';
import '../../../utlis/constants/sizes.dart';
import '../../../utlis/helpers/helpFunction.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = TSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: THelperFunction.isDarkMode(context)
              ? TColors.black
              : TColors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Image(
          image: isNetworkImage
              ? NetworkImage(image)
              : AssetImage(image) as ImageProvider,
          color: overlayColor,
          fit: fit,
        ));
  }
}
