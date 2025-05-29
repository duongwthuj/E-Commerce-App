import 'package:get/get.dart';
import 'package:thuctapcoso/data/repositories/user/user_repository.dart';
import 'package:thuctapcoso/data/servierce/network_manager.dart';
import 'package:thuctapcoso/features/personalization/controllers/user_controllers.dart';
import 'package:thuctapcoso/utlis/constants/image_strings.dart';
import 'package:thuctapcoso/utlis/popups/full_screen_loader.dart';
import 'package:thuctapcoso/utlis/popups/loaders.dart';

class UpdateGenderController extends GetxController {
  static UpdateGenderController get instance => Get.find();

  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  final selectedGender = ''.obs;

  @override
  void onInit() {
    super.onInit();
    selectedGender.value = userController.user.value.gender;
  }

  Future<void> updateGender(String gender) async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are updating your gender...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update user's gender in the Firebase Firestore
      Map<String, dynamic> genderData = {
        'Gender': gender,
      };
      await userRepository.updateSingleField(genderData);

      // Update the RX User value
      userController.user.value.gender = gender;
      selectedGender.value = gender;

      // Refresh user data
      await userController.fetchUserRecord();

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(
          title: 'Success', message: 'Your gender has been updated.');
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
