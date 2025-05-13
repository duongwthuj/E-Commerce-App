import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:thuctapcoso/common/widgets/custom_shapes/containers/round_container.dart';
import 'package:thuctapcoso/common/widgets/products/ratings/rating_indicator.dart';
import 'package:thuctapcoso/utlis/constants/colors.dart';
import 'package:thuctapcoso/utlis/constants/image_strings.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import 'package:thuctapcoso/utlis/helpers/helpFunction.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(TImages.userProfileImage1),
                ),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        // Review
        Row(
          children: [
            const TRattingIndicartor(rating: 4.5),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('100 reviews', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        ReadMoreText(
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos.',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'Show less',
          trimCollapsedText: 'Show more',
          moreStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        // Company Review
        TRoundedContainer(
            backgroundColor: dark ? TColors.darkGrey : TColors.grey,
            child: Padding(
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Company Review',
                            style: Theme.of(context).textTheme.titleMedium),
                        Text('02 Nov 2024',
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    ReadMoreText(
                      'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos.sdfhduhfuhdfuihdfuihdsdfuihdsiufhdisufh',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimExpandedText: 'Show less',
                      trimCollapsedText: 'Show more',
                      moreStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: TColors.primary),
                      lessStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: TColors.primary),
                    ),
                  ],
                )))
      ],
    );
  }
}
