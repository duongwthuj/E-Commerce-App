import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/features/personalization/controllers/address_controller.dart';
import 'package:thuctapcoso/features/personalization/screens/address/add_new_address.dart';
import 'package:thuctapcoso/features/personalization/screens/address/widget/single_address.dart';
import 'package:thuctapcoso/utlis/constants/colors.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final controller = Get.put(AddressController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Icons.add, color: TColors.white),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title:
            Text('Address', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : controller.addresses.isEmpty
                ? Center(
                    child: Text(
                      'No addresses found',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: Column(
                        children: controller.addresses
                            .map(
                              (address) => TSingleAddress(
                                address: address,
                                selectedAddress: address.selectedAddress,
                                onTap: () =>
                                    controller.setSelectedAddress(address.id),
                                onDelete: () =>
                                    controller.deleteAddress(address.id),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
      ),
    );
  }
}
