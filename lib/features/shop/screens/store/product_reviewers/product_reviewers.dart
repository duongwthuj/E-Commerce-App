import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/common/widgets/products/ratings/rating_indicator.dart';
import 'package:thuctapcoso/features/shop/screens/store/product_reviewers/widget/process_indicator_rating.dart';
import 'package:thuctapcoso/features/shop/screens/store/product_reviewers/widget/user_review_card.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';

class ProductReviewerScreen extends StatelessWidget {
  const ProductReviewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: const Text('Reviews & Ratings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Ratings and Reviews are verified and are from people who use the same type of device as you.'),
              SizedBox(height: TSizes.spaceBtwItems),

              // overall rating
              const TOverallProductRating(),

              // rating indicator
              TRattingIndicartor(rating: 3.5),

              Text(
                "100 reviews",
                style: Theme.of(context).textTheme.bodySmall,
              ),

              const SizedBox(height: TSizes.spaceBtwItems),

              // user review List
              const UserReviewCard(),
              

              
              
            ],
          ),
        ),
      ),
    );
  }
}
 