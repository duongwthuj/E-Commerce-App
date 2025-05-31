import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/features/personalization/controllers/address_controller.dart';
import 'package:thuctapcoso/features/personalization/models/address_model.dart';
import 'package:thuctapcoso/features/personalization/screens/address/address.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import 'package:thuctapcoso/utlis/validators/validator.dart';
import 'package:thuctapcoso/utlis/popups/loaders.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final controller = Get.find<AddressController>();
    final formKey = GlobalKey<FormState>();

    // Form controllers
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final streetController = TextEditingController();
    final postalCodeController = TextEditingController();
    final cityController = TextEditingController();
    final stateController = TextEditingController();
    final countryController = TextEditingController();

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Add new Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  validator: (value) =>
                      TValidator.validateEmptyText('Name', value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                TextFormField(
                  controller: phoneController,
                  validator: (value) => TValidator.validatePhoneNumber(value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone_android_outlined),
                    labelText: 'Phone Number',
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: streetController,
                        validator: (value) =>
                            TValidator.validateEmptyText('Street', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.home_outlined),
                          labelText: 'Street',
                        ),
                      ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    Expanded(
                      child: TextFormField(
                        controller: postalCodeController,
                        validator: (value) =>
                            TValidator.validateEmptyText('Postal Code', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.numbers),
                          labelText: 'Postal Code',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: cityController,
                        validator: (value) =>
                            TValidator.validateEmptyText('City', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.location_city_outlined),
                          labelText: 'City',
                        ),
                      ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    Expanded(
                      child: TextFormField(
                        controller: stateController,
                        validator: (value) =>
                            TValidator.validateEmptyText('State', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.map_outlined),
                          labelText: 'State',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                TextFormField(
                  controller: countryController,
                  validator: (value) =>
                      TValidator.validateEmptyText('Country', value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.public_outlined),
                    labelText: 'Country',
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        final newAddress = AddressModel(
                          id: '', // Will be set by Firestore
                          name: nameController.text.trim(),
                          phoneNumber: phoneController.text.trim(),
                          street: streetController.text.trim(),
                          city: cityController.text.trim(),
                          state: stateController.text.trim(),
                          postalCode: postalCodeController.text.trim(),
                          country: countryController.text.trim(),
                        );

                        // Check for duplicate address
                        final addresses = await controller.addresses;
                        final isDuplicate = addresses.any((address) =>
                            address.street == newAddress.street &&
                            address.city == newAddress.city &&
                            address.state == newAddress.state &&
                            address.postalCode == newAddress.postalCode &&
                            address.country == newAddress.country);

                        if (isDuplicate) {
                          TLoaders.warningSnackBar(
                            title: 'Địa chỉ đã tồn tại',
                            message:
                                'Địa chỉ này đã được thêm vào danh sách của bạn.',
                          );
                        } else {
                          await controller.addNewAddress(newAddress);
                          TLoaders.successSnackBar(
                            title: 'Thành công',
                            message: 'Địa chỉ đã được thêm thành công.',
                          );
                          // Quay lại màn hình danh sách địa chỉ
                          Get.offAll(() => const UserAddressScreen());
                        }
                      }
                    },
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
