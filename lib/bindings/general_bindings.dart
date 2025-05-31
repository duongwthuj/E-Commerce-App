import 'package:get/get.dart';
import 'package:thuctapcoso/data/servierce/network_manager.dart';
import 'package:thuctapcoso/features/shop/controllers/cart_controller.dart';
import 'package:thuctapcoso/features/shop/controllers/product/varitation_controller.dart';
import 'package:thuctapcoso/features/shop/controllers/product/image_controller.dart';
import 'package:thuctapcoso/features/shop/controllers/order_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(ImageController());
    Get.put(VariationController());
    Get.put(CartController());
    Get.put(OrderController());
    // Get.put(SignupController());
  }
}
