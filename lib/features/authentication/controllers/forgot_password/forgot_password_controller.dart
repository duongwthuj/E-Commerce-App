import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/data/repositories/anthentications/authentication_repository.dart';
import 'package:thuctapcoso/data/servierce/network_manager.dart';
import 'package:thuctapcoso/features/authentication/screens/login/login.dart';
import 'package:thuctapcoso/utlis/popups/full_screen_loader.dart';
import 'package:thuctapcoso/utlis/popups/loaders.dart';

class ForgotPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog('Sending password reset email...');

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
            title: 'No Internet Connection',
            message: 'Please check your internet connection');
        return;
      }

      // Check if email exists in Firestore
      final userQuery = await _firestore
          .collection('Users')
          .where('Email', isEqualTo: email)
          .get();

      if (userQuery.docs.isEmpty) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
          title: 'Account not found',
          message:
              'No account exists with this email address. Please try again.',
        );
        return;
      }

      // If email exists in Firestore, send reset email
      await _auth.sendPasswordResetEmail(email: email);

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
        title: 'Success',
        message:
            'Password reset email has been sent to your email address. Please check your email and login with your new password.',
      );

      // Navigate to login screen after successful reset email
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: 'Error',
        message: e.message ?? 'An error occurred',
      );
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: 'Error',
        message: e.toString(),
      );
    }
  }
}
