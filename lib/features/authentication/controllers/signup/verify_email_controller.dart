import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/success_screen/success_screen.dart';
import 'package:thuctapcoso/data/repositories/anthentications/authentication_repository.dart';
import 'package:thuctapcoso/features/authentication/screens/login/login.dart';
import 'package:thuctapcoso/utlis/constants/image_strings.dart';
import 'package:thuctapcoso/utlis/constants/text_strings.dart';
import 'package:thuctapcoso/utlis/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get to => Get.find();

  // send email whenever verify screen appears and set timer for auto redirect to login screen
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // send email verrification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Email sent',
          message: 'Please check your email for verification link');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh no!', message: e.toString());
    }
  }

  // timer to automatically redirect to login screen
  setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.offAll(() => SuccessScreen(
                image: TImages.staticSuccessIllustration,
                title: TTexts.yourAccountCreatedTitle,
                subtitle: TTexts.yourAccountCreatedSubTitle,
                onPressed: () =>
                    AuthenticationRepository.instance.screenRedirect(),
              ));
        }
      },
    );
  }

  // Check email verification status and handle skip button
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await currentUser
          .reload(); // Reload user to get latest verification status

      if (currentUser.emailVerified) {
        Get.offAll(() => SuccessScreen(
              image: TImages.staticSuccessIllustration,
              title: TTexts.yourAccountCreatedTitle,
              subtitle: TTexts.yourAccountCreatedSubTitle,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ));
      } else {
        // If email is not verified, show warning and stay on verify screen
        TLoaders.warningSnackBar(
            title: 'Email Not Verified',
            message:
                'Please verify your email first or check your inbox for the verification link');
      }
    }
  }
}
