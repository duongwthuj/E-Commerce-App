import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:thuctapcoso/data/repositories/user/user_repository.dart';
import 'package:thuctapcoso/features/authentication/screens/login/login.dart';
import 'package:thuctapcoso/features/authentication/screens/onboarding/onboarding.dart';
import 'package:thuctapcoso/features/authentication/screens/signup/verify_email.dart';
import 'package:thuctapcoso/navigation_menu.dart';
import 'package:thuctapcoso/utlis/exceptions/firebase_auth_exceptions.dart';
import 'package:thuctapcoso/utlis/exceptions/firebase_exceptions.dart';
import 'package:thuctapcoso/utlis/exceptions/format_exceptions.dart';
import 'package:thuctapcoso/utlis/exceptions/platform_exceptions.dart';
import 'package:thuctapcoso/utlis/popups/loaders.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Get current user ID
  String? get currentUserUid => _auth.currentUser?.uid;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to Show Relevant Screen
  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const OnBoardingScreen())
          : Get.offAll(() => const LoginScreen());
    }
  }

  // Email & Password sign-in
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Login with email and password
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Email & Password sign-in
  Future<void> sendEmailVerification() async {
    try {
      return await _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Forgot Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Google sign in
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      // Show loading
      TLoaders.loadingSnackBar(
          title: 'Logging out...', message: 'Please wait...');

      // Clear any stored data
      await deviceStorage.erase();

      // Sign out from Firebase
      await _auth.signOut();

      // Show success message
      TLoaders.successSnackBar(
          title: 'Success', message: 'Logged out successfully');

      // Redirect to login screen
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }

    
  }

  Future<void> deleteAccount() async {
      try {
        await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
        await _auth.currentUser?.delete();
      } on FirebaseAuthException catch (e) {
        throw TFirebaseAuthException(e.code).message;
      } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }
  }
  

  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.currentUser!.reauthenticateWithCredential(EmailAuthProvider.credential(email: email, password: password));
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }
  } 
}
