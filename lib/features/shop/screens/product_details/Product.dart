//   ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:thuctapcoso/common/widgets/texts/sectionsHeading.dart';
import 'package:thuctapcoso/features/shop/models/product_model.dart';
import 'package:thuctapcoso/features/shop/screens/product_details/widget/bottom_add_to_cart.dart';
import 'package:thuctapcoso/features/shop/screens/product_details/widget/product_attributes.dart';
import 'package:thuctapcoso/features/shop/screens/product_details/widget/product_detail_image_slider.dart';
import 'package:thuctapcoso/features/shop/screens/product_details/widget/product_meta_data.dart';
import 'package:thuctapcoso/features/shop/screens/product_details/widget/rating_share_widget.dart';
import 'package:thuctapcoso/features/shop/screens/store/product_reviewers/product_reviewers.dart';
import 'package:thuctapcoso/utlis/constants/enums.dart';
import '../../../../utlis/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunction.isDarkMode(context);

    return Scaffold(
        bottomNavigationBar: TBottomAddToCart(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Product image slider
              TProductImageSlider(product: product),

              // Product details
              Padding(
                padding: EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace,
                ),
                child: Column(
                  children: [
                    // Rating and share
                    TRatingandShare(),
                    // Price title stack brands
                    TProductMetaData(product: product),
                    // attribute
                    if (product.productAttributes != null &&
                        product.productAttributes!.isNotEmpty)
                      TProductAttributes(product: product),
                    if (product.productAttributes != null &&
                        product.productAttributes!.isNotEmpty)
                      const SizedBox(height: TSizes.spaceBtwItems * 1.5),
                    // checkout button
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text('Checkout'))),
                    const SizedBox(height: TSizes.spaceBtwItems * 1.5),
                    // description
                    const TSectionsHeading(
                        title: 'Description', showActionButton: false),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    ReadMoreText(
                      product.description ?? '',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: '...Read more',
                      trimExpandedText: ' Show less',
                      moreStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w800),
                      lessStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w800),
                    ),

                    // reviews
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems * 1.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TSectionsHeading(
                            title: 'Reviews', showActionButton: false),
                        IconButton(
                          icon: const Icon(Icons.arrow_right, size: 18),
                          onPressed: () =>
                              Get.to(() => ProductReviewerScreen()),
                        ),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                  ],
                ),
              )
            ],
            // product details
          ),
        ));
  }
}
