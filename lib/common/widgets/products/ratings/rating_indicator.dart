import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:thuctapcoso/utlis/constants/colors.dart';

class TRattingIndicartor extends StatelessWidget {
  const TRattingIndicartor({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      unratedColor: TColors.grey,
      itemBuilder: (_, __) => const Icon(
        Icons.star,
        color: TColors.primary,
      ),
    );
  }
}