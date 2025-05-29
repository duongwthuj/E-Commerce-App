import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/data/models/user_model.dart';
import 'package:thuctapcoso/data/repositories/anthentications/authentication_repository.dart';
import 'package:thuctapcoso/data/repositories/user/user_repository.dart';
import 'package:thuctapcoso/features/authentication/screens/signup/verify_email.dart';
import 'package:thuctapcoso/data/servierce/network_manager.dart';
import 'package:thuctapcoso/utlis/constants/image_strings.dart';
import 'package:thuctapcoso/utlis/popups/full_screen_loader.dart';
import 'package:thuctapcoso/utlis/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  SignupController();

  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog('we are processing your request....', TImages.docerAnimation);

      // Form validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Check privacy policy
      if (!privacyPolicy.value) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
            title: 'Privacy Policy',
            message: 'Please accept the privacy policy and terms of use');
        return;
      }

      // Check internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
            title: 'No Internet Connection',
            message: 'Please check your internet connection');
        return;
      }

      // Register with email and password
      final user =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );
      if (user.user == null) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
            title: 'Signup Failed', message: 'Signup failed');
        return;
      }
      final newUser = UserModel(
        id: user.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = UserRepository.instance;
      await userRepository.createUser(newUser.toJson());

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
          title: 'Signup Success', message: 'Signup successful');
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // show error
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: 'error',
        message: e.toString(),
      );
    }
  }

  // @override
  // void onClose() {
  //   email.dispose();
  //   firstName.dispose();
  //   lastName.dispose();
  //   username.dispose();
  //   password.dispose();
  //   phoneNumber.dispose();
  //   super.onClose();
  // }
}
