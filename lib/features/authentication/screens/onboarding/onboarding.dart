import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/utlis/constants/text_strings.dart';
import 'package:thuctapcoso/utlis/device/device_utility.dart';
import 'package:thuctapcoso/utlis/helpers/helpFunction.dart';
import '../../../../utlis/constants/colors.dart';
import '../../../../utlis/constants/image_strings.dart';
import '../../../../utlis/constants/sizes.dart';
import '../widgets/onboarding_navigation.dart';
import '../widgets/onboarding_nextbutton.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/onboarding_skip.dart';
import 'package:thuctapcoso/features/authentication/controllers_onboarding/onboarding_controller.dart';
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
        body: Stack(
      children: [
        // Horizontal PageView
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
          children: const [
            OnBoardingPage(
                image: TImages.onboarding1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubtitle1),
            OnBoardingPage(
                image: TImages.onboarding2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubtitle2),
            OnBoardingPage(
                image: TImages.onboarding3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubtitle3),
          ],
        ),

        // Skip Button
        const OnBoardingSkip(),

        // Navigation Smooth Indicator
        OnBoardingNavigation(),

        // Circular Button (Next, Back)
        OnBoardingNextButton()
      ],
    ));
  }
}


