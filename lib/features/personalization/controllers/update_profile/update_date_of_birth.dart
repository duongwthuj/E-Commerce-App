import 'package:get/get.dart';
import 'package:thuctapcoso/data/repositories/user/user_repository.dart';
import 'package:thuctapcoso/data/servierce/network_manager.dart';
import 'package:thuctapcoso/features/personalization/controllers/user_controllers.dart';
import 'package:thuctapcoso/utlis/constants/image_strings.dart';
import 'package:thuctapcoso/utlis/popups/full_screen_loader.dart';
import 'package:thuctapcoso/utlis/popups/loaders.dart';

class UpdateDateOfBirthController extends GetxController {
  static UpdateDateOfBirthController get instance => Get.find();

  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  final selectedDate = ''.obs;

  @override
  void onInit() {
    super.onInit();
    selectedDate.value = userController.user.value.dateOfBirth;
  }

  Future<void> updateDateOfBirth(String date) async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are updating your date of birth...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update user's date of birth in the Firebase Firestore
      Map<String, dynamic> dateData = {
        'DateOfBirth': date,
      };
      await userRepository.updateSingleField(dateData);

      // Update the RX User value
      userController.user.value.dateOfBirth = date;
      selectedDate.value = date;

      // Refresh user data
      await userController.fetchUserRecord();

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(
          title: 'Success', message: 'Your date of birth has been updated.');
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Error Message
      TLoaders.errorSnackBar(
          title: 'Oops',
          message: 'Something went wrong. Please try again later.');
    }
  }
}
