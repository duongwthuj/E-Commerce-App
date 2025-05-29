import 'package:get/get.dart';
import 'package:thuctapcoso/data/repositories/banner/banner_repository.dart';
import 'package:thuctapcoso/features/shop/models/banner_model.dart';

class BannerController extends GetxController {
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  final BannerRepository _repo = BannerRepository();
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;
      final data = await _repo.getAllBanners();
      banners.assignAll(data);
    } catch (e) {
      // handle error
    } finally {
      isLoading.value = false;
    }
  }
}
