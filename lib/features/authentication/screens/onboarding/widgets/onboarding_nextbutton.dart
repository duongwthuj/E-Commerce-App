import 'package:flutter/material.dart';
import 'package:thuctapcoso/features/authentication/controllers_onboarding/onboarding_controller.dart';

import '../../../../../utlis/constants/colors.dart';
import '../../../../../utlis/constants/sizes.dart';
import '../../../../../utlis/device/device_utility.dart';
import '../../../../../utlis/helpers/helpFunction.dart';


class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Positioned(

        right: TSizes.defaultSpace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight() - 15,
        child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
            backgroundColor: dark
                ? TColors.primaryColor
                : TColors.black,
            shape: const CircleBorder(),
          ),
          child: Icon(Icons.arrow_forward_ios),
        ));
  }
}