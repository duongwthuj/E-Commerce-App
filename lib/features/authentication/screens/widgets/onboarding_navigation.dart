import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:thuctapcoso/features/authentication/controllers_onboarding/onboarding_controller.dart';
import '../../../../utlis/constants/colors.dart';
import '../../../../utlis/constants/sizes.dart';
import '../../../../utlis/device/device_utility.dart';
import '../../../../utlis/helpers/helpFunction.dart';

class OnBoardingNavigation extends StatelessWidget {
  const OnBoardingNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final controller = OnBoardingController.instance;
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.changeNavigationClick,
        count: 3,
        effect:  ExpandingDotsEffect(
          activeDotColor: dark ? TColors.light: TColors.dark,
          dotHeight: 12,
          dotWidth: 12,
          spacing: 8,
          expansionFactor: 2,
        ),
      ),
    );
  }
}
