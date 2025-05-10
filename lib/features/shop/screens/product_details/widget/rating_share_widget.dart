import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../utlis/constants/sizes.dart';

class TRatingandShare extends StatelessWidget {
  const TRatingandShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // Rating
            Icon(Icons.star, color: Colors.amber, size: 24),
            SizedBox(width: TSizes.spaceBtwItems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '5.0',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const TextSpan(text: '(20)'),
                ],
              ),
            ),
          ],
        ),
        IconButton(onPressed: () {}, icon : Icon(Icons.share, color: Colors.black, size: TSizes.iconSm)),
      ],
    );
  }
}