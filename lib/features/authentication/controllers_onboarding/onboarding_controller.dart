import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  void updatePageIndicator(int index) => currentPageIndex.value = index;

  void changeNavigationClick(value) {
    currentPageIndex.value = value;
    pageController.jumpTo(value);
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();

      if (kDebugMode) {
        print("=========== Get Storage =========");
        print(storage.read('isFirstTime'));
      }
      storage.write('isFirstTime', false);
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      // currentPageIndex.value = page;
      pageController.jumpToPage(page);
    }
  }

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }

  void skipToLogin() {
    Get.offAll(const LoginScreen());
  }
}
