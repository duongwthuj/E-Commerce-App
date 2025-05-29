import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:thuctapcoso/data/dataTest/upload_dummy_banner.dart';
import 'package:thuctapcoso/data/repositories/anthentications/authentication_repository.dart';
import 'package:thuctapcoso/data/repositories/user/user_repository.dart';
import 'package:thuctapcoso/features/personalization/controllers/user_controllers.dart';
import 'firebase_options.dart';
import 'app.dart';

// import 'package:thuctapcoso/data/repositories.authentication/authentication_repository.dart';

/// -- Entry point of Flutter App
Future<void> main() async {
  /// Widgets Binding
  WidgetsFlutterBinding.ensureInitialized();

  /// -- GETX Local Storage
  await GetStorage.init();

  FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);

  /// -- Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// Initialize Authentication Repository with proper instance
  Get.put(AuthenticationRepository());
  Get.put(UserRepository());
  Get.put(UserController());

  // Upload test categories to Firestore
  // await uploadCategoriesToFirestore();
  // await uploadBannersToFirestore();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  /// LOAD ALL the MATERIAL DESIGN / THEMES / LOCALIZATIONS / BINDINGS
  runApp(const App());
}
