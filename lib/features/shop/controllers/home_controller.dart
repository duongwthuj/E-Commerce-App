import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final carousaCurrnetIndex = 0.obs;

  void updatePageIndicator(int index) {
    carousaCurrnetIndex.value = index;
  }

  
}
