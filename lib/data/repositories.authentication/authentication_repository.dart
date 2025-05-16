import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:thuctapcoso/features/authentication/screens/login/login.dart';
import 'package:thuctapcoso/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// variables
  final deviceStorage = GetStorage();

  /// Called from main.dart on app launch
  @override
  void onReady() {
    if (kDebugMode) {
      print("=========== AuthRepository onReady Called =========");
    }
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to Show Relevant Screen
  screenRedirect() async {
    if (kDebugMode) {
      print("=========== Screen Redirect Called =========");
      print("Before Storage Write: ${deviceStorage.read('isFirstTime')}");
    }

    final isFirstTime = deviceStorage.read('isFirstTime') ?? true;

    if (kDebugMode) {
      print("Is First Time?: $isFirstTime");
    }

    if (isFirstTime) {
      deviceStorage.write('isFirstTime', false);
      if (kDebugMode) {
        print("Navigating to OnBoarding Screen");
      }
      Get.offAll(() => const OnBoardingScreen());
    } else {
      if (kDebugMode) {
        print("Navigating to Login Screen");
      }
      Get.offAll(() => const LoginScreen());
    }

    // Email & Password sign-in
    // EmailAuthentication - SignIn
    // EmailAuthentication - Register
  }
}
