import 'package:get/get.dart';
import '../../../data/repositories/anthentications/authentication_repository.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../controllers/signup/sigunup_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // Register repositories first
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository(),
        fenix: true);
    Get.lazyPut<UserRepository>(() => UserRepository(), fenix: true);

    // Then register controllers
    Get.lazyPut<SignupController>(() => SignupController(), fenix: true);
  }
}
