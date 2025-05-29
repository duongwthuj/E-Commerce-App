import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/data/models/user_model.dart';
import 'package:thuctapcoso/data/repositories/user/user_repository.dart';
import 'package:thuctapcoso/data/servierce/network_manager.dart';
import 'package:thuctapcoso/features/personalization/controllers/user_controllers.dart';
import 'package:thuctapcoso/features/personalization/screens/profile/profile.dart';
import 'package:thuctapcoso/utlis/constants/image_strings.dart';
import 'package:thuctapcoso/utlis/popups/full_screen_loader.dart';
import 'package:thuctapcoso/utlis/popups/loaders.dart';

/// Controller to manage username update functionality.
class UpdateUsernameController extends GetxController {
  static UpdateUsernameController get instance => Get.find();

  final username = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUsernameFormKey = GlobalKey<FormState>();

  /// init user data when Home Screen appears
  @override
  void onInit() {
    initializeUsername();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeUsername() async {
    username.text = userController.user.value.username;
  }

  Future<void> updateUsername() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are updating your username...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUsernameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update user's username in the Firebase Firestore
      Map<String, dynamic> usernameData = {
        'Username': username.text.trim(),
      };
      await userRepository.updateSingleField(usernameData);

      // Update the RX User value by creating a new instance
      final currentUser = userController.user.value;
      userController.user.value = UserModel(
        id: currentUser.id,
        firstName: currentUser.firstName,
        lastName: currentUser.lastName,
        username: username.text.trim(),
        email: currentUser.email,
        phoneNumber: currentUser.phoneNumber,
        profilePicture: currentUser.profilePicture,
      );

      // Refresh user data
      await userController.fetchUserRecord();

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your username has been updated.');

      // Move to previous screen.
      Get.off(() => const ProfileScreen());
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
