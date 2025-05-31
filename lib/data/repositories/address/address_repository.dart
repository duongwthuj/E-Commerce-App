import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/data/repositories/anthentications/authentication_repository.dart';
import 'package:thuctapcoso/features/personalization/models/address_model.dart';

class AddressRepository extends GetxController {
  static AddressRepository get to => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Get all addresses for current user
  Future<List<AddressModel>> fetchUserAddresses() async {
    try {
      final user = AuthenticationRepository.instance.currentUserUid;
      if (user == null) {
        throw Exception('User not found');
      }
      final result =
          await _db.collection('Users').doc(user).collection('Addresses').get();
      return result.docs
          .map((documentSnapshot) =>
              AddressModel.fromDocumentSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /// Add new address
  Future<void> addAddress(AddressModel address) async {
    try {
      final user = AuthenticationRepository.instance.currentUserUid;
      if (user == null) {
        throw Exception('User not found');
      }

      // If this is the first address, set it as selected
      final addresses = await fetchUserAddresses();
      if (addresses.isEmpty) {
        address.selectedAddress = true;
      } else {
        // Ensure no other address is selected
        address.selectedAddress = false;
      }

      // Convert to map
      final addressData = {
        'Name': address.name,
        'PhoneNumber': address.phoneNumber,
        'Street': address.street,
        'City': address.city,
        'State': address.state,
        'PostalCode': address.postalCode,
        'Country': address.country,
        'SelectedAddress': address.selectedAddress,
      };

      await _db
          .collection('Users')
          .doc(user)
          .collection('Addresses')
          .add(addressData);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /// Update existing address
  Future<void> updateAddress(AddressModel address) async {
    try {
      final user = AuthenticationRepository.instance.currentUserUid;
      if (user == null) {
        throw Exception('User not found');
      }

      // Convert to map
      final addressData = {
        'Name': address.name,
        'PhoneNumber': address.phoneNumber,
        'Street': address.street,
        'City': address.city,
        'State': address.state,
        'PostalCode': address.postalCode,
        'Country': address.country,
        'SelectedAddress': address.selectedAddress,
      };

      await _db
          .collection('Users')
          .doc(user)
          .collection('Addresses')
          .doc(address.id)
          .update(addressData);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /// Delete address
  Future<void> deleteAddress(String addressId) async {
    try {
      final user = AuthenticationRepository.instance.currentUserUid;
      if (user == null) {
        throw Exception('User not found');
      }

      // Check if the address being deleted is selected
      final addresses = await fetchUserAddresses();
      final addressToDelete =
          addresses.firstWhere((addr) => addr.id == addressId);

      await _db
          .collection('Users')
          .doc(user)
          .collection('Addresses')
          .doc(addressId)
          .delete();

      // If the deleted address was selected and there are other addresses,
      // select the first remaining address
      if (addressToDelete.selectedAddress && addresses.length > 1) {
        final remainingAddresses =
            addresses.where((addr) => addr.id != addressId).toList();
        if (remainingAddresses.isNotEmpty) {
          await setSelectedAddress(remainingAddresses.first.id);
        }
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /// Set selected address
  Future<void> setSelectedAddress(String addressId) async {
    try {
      final user = AuthenticationRepository.instance.currentUserUid;
      if (user == null) {
        throw Exception('User not found');
      }

      // Get all addresses
      final addresses = await fetchUserAddresses();

      // Update all addresses to unselected
      for (var address in addresses) {
        await _db
            .collection('Users')
            .doc(user)
            .collection('Addresses')
            .doc(address.id)
            .update({'SelectedAddress': false});
      }

      // Set the selected address
      await _db
          .collection('Users')
          .doc(user)
          .collection('Addresses')
          .doc(addressId)
          .update({'SelectedAddress': true});
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
