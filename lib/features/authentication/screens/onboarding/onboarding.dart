import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/features/authentication/screens/onboarding/widgets/onboarding_navigation.dart';
import 'package:thuctapcoso/features/authentication/screens/onboarding/widgets/onboarding_nextbutton.dart';
import 'package:thuctapcoso/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:thuctapcoso/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:thuctapcoso/utlis/constants/text_strings.dart';
import '../../../../utlis/constants/image_strings.dart';
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
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1),
            OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2),
            OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3),
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


