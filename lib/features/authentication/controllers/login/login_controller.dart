import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:thuctapcoso/data/repositories/anthentications/authentication_repository.dart';
import 'package:thuctapcoso/data/servierce/network_manager.dart';
import 'package:thuctapcoso/features/personalization/controllers/user_controllers.dart';
import 'package:thuctapcoso/utlis/popups/full_screen_loader.dart';
import 'package:thuctapcoso/utlis/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    // TODO: implement onInit
    email.text = localStorage.read('email') ?? '';
    password.text = localStorage.read('password') ?? '';
    super.onInit();
  }
  
  

  // Login
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog('Logging you in...');


      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
            title: 'No Internet Connection',
            message: 'Please check your internet connection');
        return;
      }

      // Form validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save date if remember me is true
      if (rememberMe.value) {
        localStorage.write('email', email.text.trim());
        localStorage.write('password', password.text.trim());
      } 

      // login with email and password
      final userCredential = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      TFullScreenLoader.stopLoading();

      // Redirect to home screen
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }


  // Google sign in
  Future<void> googleSingIn() async {
  try {
      // Start loading
      TFullScreenLoader.openLoadingDialog('Logging you in...');


      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
            title: 'No Internet Connection',
            message: 'Please check your internet connection');
        return;
      }

    // Google sign in
    final userCredential = AuthenticationRepository.instance.signInWithGoogle();


    // Save user data
    UserController.instance.saveUserRecord(await userCredential);

      // Redirect to home screen
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
