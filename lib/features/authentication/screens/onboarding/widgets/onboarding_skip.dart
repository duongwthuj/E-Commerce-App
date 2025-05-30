import 'package:flutter/material.dart';
import '../../../../../utlis/constants/sizes.dart';
import '../../../../../utlis/device/device_utility.dart';
import '../../../controllers_onboarding/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipToLogin(),
          child: const Text('Skip'),
        ));
  }
}