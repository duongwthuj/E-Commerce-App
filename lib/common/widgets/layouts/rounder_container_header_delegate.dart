import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utlis/constants/colors.dart';
import '../../../utlis/constants/sizes.dart';
import '../../../utlis/helpers/helpFunction.dart';
import '../brands/brand_card.dart';
import '../custom_shapes/containers/round_container.dart';

class RoundedContainerHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color:
          THelperFunction.isDarkMode(context) ? TColors.black : TColors.white,
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: TRoundedContainer(
        showBorder: true,
        borderColor: TColors.darkerGrey,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwSections),
        // child: const TBrandCard(showBorder: false),
      ),
    );
  }

  @override
  double get maxExtent => 100.0; // Chiều cao tối đa của header
  @override
  double get minExtent => 100.0; // Chiều cao tối thiểu của header

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
