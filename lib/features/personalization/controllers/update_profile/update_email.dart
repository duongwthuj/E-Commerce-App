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
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

/// Controller to manage email update functionality.
class UpdateEmailController extends GetxController {
  static UpdateEmailController get instance => Get.find();

  final email = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  final auth = FirebaseAuth.instance;
  GlobalKey<FormState> updateEmailFormKey = GlobalKey<FormState>();

  // Observable for email verification status
  final emailVerified = false.obs;
  Timer? _verificationTimer;

  /// init user data when Home Screen appears
  @override
  void onInit() {
    initializeEmail();
    checkEmailVerification();
    super.onInit();
  }

  @override
  void onClose() {
    _verificationTimer?.cancel();
    super.onClose();
  }

  /// Fetch user record
  Future<void> initializeEmail() async {
    email.text = userController.user.value.email;
  }

  // Check email verification status periodically
  void checkEmailVerification() {
    _verificationTimer?.cancel();
    _verificationTimer =
        Timer.periodic(const Duration(seconds: 3), (timer) async {
      final user = auth.currentUser;
      if (user != null) {
        await user.reload();
        final verified = user.emailVerified;
        emailVerified.value = verified;

        if (verified) {
          _verificationTimer?.cancel();
          TLoaders.successSnackBar(
            title: 'Email Verified',
            message: 'Your email has been successfully verified!',
          );
        }
      }
    });
  }

  Future<void> updateEmail() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are updating your email...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateEmailFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Get current user
      final user = auth.currentUser;
      if (user == null) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
            title: 'Error', message: 'No user is currently signed in.');
        return;
      }

      // Update email in Firebase Auth
      await user.updateEmail(email.text.trim());

      // Send email verification
      await user.sendEmailVerification();

      // Update user's email in the Firebase Firestore
      Map<String, dynamic> emailData = {
        'Email': email.text.trim(),
      };
      await userRepository.updateSingleField(emailData);

      // Update the RX User value by creating a new instance
      final currentUser = userController.user.value;
      userController.user.value = UserModel(
        id: currentUser.id,
        firstName: currentUser.firstName,
        lastName: currentUser.lastName,
        username: currentUser.username,
        email: email.text.trim(),
        phoneNumber: currentUser.phoneNumber,
        profilePicture: currentUser.profilePicture,
      );

      // Refresh user data
      await userController.fetchUserRecord();

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(
          title: 'Email Updated',
          message:
              'Your email has been updated. Please check your inbox and click the verification link to complete the process.');

      // Start checking for email verification
      checkEmailVerification();

      // Move to previous screen.
      Get.off(() => const ProfileScreen());
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Error Message
      TLoaders.errorSnackBar(title: 'Oops', message: e.toString());
    }
  }

  // Check if email is verified
  Future<bool> isEmailVerified() async {
    final user = auth.currentUser;
    if (user != null) {
      await user
          .reload(); // Reload user to get latest email verification status
      return user.emailVerified;
    }
    return false;
  }
}
