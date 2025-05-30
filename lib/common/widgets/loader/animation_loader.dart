import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:thuctapcoso/utlis/constants/colors.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget({super.key, required this.text, required this.animation, required this.showAction, this.actionText, this.onAction});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.5),
          const SizedBox(height: TSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.defaultSpace),
          showAction 
            ? SizedBox(
              width: 250,
              child: OutlinedButton(
                onPressed: onAction,
                style: OutlinedButton.styleFrom(backgroundColor: TColors.dark),
                child: Text(
                  actionText!,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
                )
              )
            )
          : const SizedBox(),
        ], 
      ),
    );
  }
}
