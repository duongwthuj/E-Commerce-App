import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/custom_shapes/containers/round_container.dart';
import 'package:thuctapcoso/common/widgets/products/product_cards/prodcut_price_text.dart';
import 'package:thuctapcoso/common/widgets/texts/product_text.dart';
import 'package:thuctapcoso/common/widgets/texts/sectionsHeading.dart';
import 'package:thuctapcoso/features/shop/controllers/product/varitation_controller.dart';
import 'package:thuctapcoso/features/shop/models/product_model.dart';
import 'package:thuctapcoso/utlis/helpers/helpFunction.dart';
import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../utlis/constants/colors.dart';
import '../../../../../utlis/constants/sizes.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final controller = Get.put(VariationController());

    controller.initializeVariation(product);

    return Obx(
      () => Column(
        children: [
          if (product.productVariants != null && product.productVariants!.isNotEmpty)
            TRoundedContainer(
              backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
              child: Column(
                children: [
                  Row(
                    children: [
                      const TSectionsHeading(title: 'Variation', showActionButton: false),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const TProductTittleText(title: 'Price', smallSize: true),
                              const SizedBox(width: TSizes.spaceBtwItems),
                              if (controller.selectedVariation.value.salePrice > 0)
                                Text(
                                  "\$${controller.selectedVariation.value.price}",
                                  style: Theme.of(context).textTheme.titleSmall!.apply(
                                        decoration: TextDecoration.lineThrough,
                                        color: TColors.darkGrey, // Đổi màu giá gốc
                                      ),
                                ),
                              if (controller.selectedVariation.value.salePrice > 0)
                                const SizedBox(width: TSizes.spaceBtwItems),
                              TProductPriceText(price: controller.getVaritationPrice()),
                            ],
                          ),
                          Row(
                            children: [
                              const TProductTittleText(title: 'Stock: ', smallSize: true),
                              Text(
                                controller.variationStockStatus.value.isEmpty
                                    ? 'N/A'
                                    : controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Hiển thị mô tả của biến thể
                  TProductTittleText(
                    title: controller.selectedVariation.value.description?.isNotEmpty == true
                        ? controller.selectedVariation.value.description!
                        : product.description ?? 'Không có mô tả',
                    smallSize: true,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          const SizedBox(height: TSizes.spaceBtwItems),

          if (product.productAttributes != null && product.productAttributes!.isNotEmpty)
            ...product.productAttributes!.map((attribute) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TSectionsHeading(title: attribute.name ?? ''),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    Obx(
                      () => Wrap(
                        spacing: 8,
                        children: attribute.values!.map((attributeValue) {
                          final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                          final available = controller
                              .getAttributesAvailabilityInVariation(
                                  product.productVariants!, attribute.name!)
                              .contains(attributeValue);
                          return TChoiceChip(
                            text: attributeValue,
                            selected: isSelected,
                            onSelected: available
                                ? (selected) {
                                    if (selected) {
                                      controller.onAttributeSelected(
                                          product, attribute.name!, attributeValue);
                                    }
                                  }
                                : null,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                )),
        ],
      ),
    );
  }
}