import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/data/repositories/anthentications/authentication_repository.dart';
import 'package:thuctapcoso/data/servierce/network_manager.dart';
import 'package:thuctapcoso/navigation_menu.dart';
import 'package:thuctapcoso/utlis/popups/full_screen_loader.dart';
import 'package:thuctapcoso/utlis/popups/loaders.dart';

class ForgotPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
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

      // Check if email exists
      final methods = await _auth.fetchSignInMethodsForEmail(email);
      if (methods.isEmpty) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
          title: 'Account not found',
          message:
              'No account exists with this email address. Please try again.',
        );
        return;
      }

      // If email exists, send reset email
      await _auth.sendPasswordResetEmail(email: email);

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
        title: 'Success',
        message: 'Password reset email has been sent to your email address',
      );

      // Navigate to home screen only after successful reset email
      Get.offAll(() => const NavigationMenu());
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
