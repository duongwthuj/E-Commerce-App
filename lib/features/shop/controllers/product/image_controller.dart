import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/features/shop/models/product_model.dart';
import 'package:thuctapcoso/common/widgets/images/cached_network_image.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  final RxString selectedProductImage = ''.obs;

  bool isValidImageUrl(String url) {
    // Check if URL is empty
    if (url.isEmpty) return false;

    // Check if URL starts with http or https
    if (url.startsWith('http://') || url.startsWith('https://')) {
      return true;
    }

    return false;
  }

  List<String> getAllProductImages(ProductModel product) {
    // Use Set to avoid duplicates
    Set<String> images = {};

    // Add thumbnail if it's valid
    if (isValidImageUrl(product.thumbnail)) {
      images.add(product.thumbnail);
      // Set initial selected image
      if (selectedProductImage.value.isEmpty) {
        selectedProductImage.value = product.thumbnail;
      }
    }

    // Add images from images list if not null and not empty
    if (product.images != null && product.images!.isNotEmpty) {
      for (var image in product.images!) {
        if (isValidImageUrl(image)) {
          images.add(image);
        }
      }
    }

    // Add images from variations if not null
    if (product.productVariants != null &&
        product.productVariants!.isNotEmpty) {
      for (var variation in product.productVariants!) {
        if (variation.image != null && isValidImageUrl(variation.image!)) {
          images.add(variation.image!);
        }
      }
    }

    // Convert Set to List
    return images.toList();
  }

  void showEnlargeImage(String imageUrl) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Stack(
          children: [
            // Background color
            Container(
              color: Colors.black,
            ),
            // Image
            Center(
              child: CacheNetworkImage(
                image: imageUrl,
                fit: BoxFit.contain,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            // Close button
            Positioned(
              top: 40,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.black),
                  onPressed: () => Get.back(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
