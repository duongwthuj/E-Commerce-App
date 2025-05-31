import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/texts/sectionsHeading.dart';
import 'package:thuctapcoso/features/personalization/controllers/address_controller.dart';
import 'package:thuctapcoso/features/personalization/screens/address/address.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import 'package:thuctapcoso/utlis/popups/full_screen_loader.dart';
import 'package:thuctapcoso/utlis/popups/loaders.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller if not already initialized
    final addressController = Get.put(AddressController());

    return Obx(() {
      final selectedAddress = addressController.selectedAddress;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TSectionsHeading(
              title: 'Shipping Address',
              buttonTitle: 'Change',
              onPressed: () async {
                try {
                  // Show loading indicator
                  TFullScreenLoader.openLoadingDialog('Loading addresses...',
                      'assets/images/animations/loading.json');

                  // Navigate to address screen and wait for result
                  await Get.to(() => const UserAddressScreen());

                  // Refresh addresses after returning
                  await addressController.fetchAddresses();

                  // Hide loading indicator
                  TFullScreenLoader.stopLoading();
                } catch (e) {
                  // Hide loading indicator
                  TFullScreenLoader.stopLoading();

                  // Show error message
                  TLoaders.errorSnackBar(
                      title: 'Error',
                      message:
                          'Unable to load addresses. Please check your internet connection and try again.');
                }
              }),
          if (selectedAddress != null) ...[
            Text(selectedAddress.name,
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Row(
              children: [
                const Icon(Icons.phone, color: Colors.grey, size: 16),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text(selectedAddress.formattedPhoneNo,
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Row(
              children: [
                const Icon(Icons.location_history,
                    color: Colors.grey, size: 16),
                const SizedBox(width: TSizes.spaceBtwItems),
                Expanded(
                  child: Text(
                      '${selectedAddress.street}, ${selectedAddress.city}, ${selectedAddress.state} ${selectedAddress.postalCode}, ${selectedAddress.country}',
                      style: Theme.of(context).textTheme.bodyMedium,
                      softWrap: true),
                ),
              ],
            ),
          ] else ...[
            Text('No address selected',
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Text('Please select or add a shipping address',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ],
      );
    });
  }
}
