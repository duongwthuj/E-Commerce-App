import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CacheNetworkImage extends StatelessWidget {
  const CacheNetworkImage({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.errorWidget,
    this.placeholder, this.progressIndicatorBuilder,
    });

  final String image;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? errorWidget;
  final Widget? placeholder;
  final Widget? progressIndicatorBuilder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        color: Colors.grey[300],
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        color: Colors.grey[300],
        child: const Icon(Icons.error),
      ),
    );
  }
}
