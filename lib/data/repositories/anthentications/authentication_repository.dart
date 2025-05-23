import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:thuctapcoso/features/authentication/screens/login/login.dart';
import 'package:thuctapcoso/features/authentication/screens/onboarding/onboarding.dart';
import 'package:thuctapcoso/utlis/exceptions/firebase_exceptions.dart';

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
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') == true
        ? Get.offAll(() => const OnBoardingScreen())
        : Get.offAll(() => const LoginScreen());
  }

  // Email & Password sign-in
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseException(e.code);
    } on FormatException catch (e) {
      throw FormatException(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // // Email & Password sign-in
  // Future<UserCredential> loginWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     return await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     throw TFirebaseException(e.code);
  //   } on FormatException catch (e) {
  //     throw FormatException(e.message);
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  // // Logout
  // Future<void> logout() async {
  //   try {
  //     await _auth.signOut();
  //   } on FirebaseAuthException catch (e) {
  //     throw TFirebaseException(e.code);
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }
}
