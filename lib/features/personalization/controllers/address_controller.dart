import 'package:get/get.dart';
import 'package:thuctapcoso/data/repositories/address/address_repository.dart';
import 'package:thuctapcoso/features/personalization/models/address_model.dart';
import 'package:thuctapcoso/utlis/popups/loaders.dart';

class AddressController extends GetxController {
  static AddressController get to => Get.find();

  final _addressRepository = Get.put(AddressRepository());

  // Observable list of addresses
  final RxList<AddressModel> addresses = <AddressModel>[].obs;

  // Loading state
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAddresses();
  }

  /// Fetch all addresses
  Future<void> fetchAddresses() async {
    try {
      isLoading.value = true;
      final result = await _addressRepository.fetchUserAddresses();
      addresses.assignAll(result);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Add new address
  Future<void> addNewAddress(AddressModel address) async {
    try {
      isLoading.value = true;
      await _addressRepository.addAddress(address);
      await fetchAddresses(); // Refresh the list
      TLoaders.successSnackBar(
          title: 'Success', message: 'Address added successfully');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Update existing address
  Future<void> updateAddress(AddressModel address) async {
    try {
      isLoading.value = true;
      await _addressRepository.updateAddress(address);
      await fetchAddresses(); // Refresh the list
      TLoaders.successSnackBar(
          title: 'Success', message: 'Address updated successfully');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Delete address
  Future<void> deleteAddress(String addressId) async {
    try {
      isLoading.value = true;
      await _addressRepository.deleteAddress(addressId);
      await fetchAddresses(); // Refresh the list
      TLoaders.successSnackBar(
          title: 'Success', message: 'Address deleted successfully');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Set selected address
  Future<void> setSelectedAddress(String addressId) async {
    try {
      // Update in Firestore
      await _addressRepository.setSelectedAddress(addressId);

      // Update in memory - much faster approach
      for (var address in addresses) {
        address.selectedAddress = address.id == addressId;
      }
      // Trigger UI update
      addresses.refresh();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  /// Get selected address
  AddressModel? get selectedAddress =>
      addresses.firstWhereOrNull((address) => address.selectedAddress);
}
