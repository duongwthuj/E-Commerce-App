import 'package:get/get.dart';
import 'package:thuctapcoso/data/servierce/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    // Get.put(SignupController());
  }
}
