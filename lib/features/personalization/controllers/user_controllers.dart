import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/data/models/user_model.dart';
import 'package:thuctapcoso/data/repositories/anthentications/authentication_repository.dart';
import 'package:thuctapcoso/data/repositories/user/user_repository.dart';
import 'package:thuctapcoso/data/servierce/network_manager.dart';
import 'package:thuctapcoso/features/authentication/screens/login/login.dart';
import 'package:thuctapcoso/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:thuctapcoso/utlis/constants/image_strings.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import 'package:thuctapcoso/utlis/popups/full_screen_loader.dart';
import 'package:thuctapcoso/utlis/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onReady() {
    super.onReady();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // Convert Name to First and Last Name

        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        // Map Data
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        // Save User Data
        await UserRepository.instance.createUser(user.toJson());
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message:
            'Something went wrong while saving your information. You can re-save your data in your Profile.',
      );
    }
  }

  // Delete Account Waring
  void deleteAccountWarning() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: 'Delete Account',
        middleText: 'Are you sure you want to delete your account?',
        cancel: ElevatedButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          child: const Text('Delete'),
        ));
  }

  /// delete user Account
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.docerAnimation);

      /// First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        final provider =
            currentUser.providerData.map((e) => e.providerId).first;
        if (provider.isNotEmpty) {
          /// Re Verify Auth Email
          if (provider == 'google.com') {
            await auth.signInWithGoogle();
            await auth.deleteAccount();
            TFullScreenLoader.stopLoading();
            Get.offAll(() => const LoginScreen());
          } else if (provider == 'password') {
            TFullScreenLoader.stopLoading();
            Get.to(() => const ReAuthLoginForm());
          }
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Re-Authenticate User
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.docerAnimation);

      // Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
