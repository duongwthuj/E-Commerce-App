import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/features/personalization/controllers/update_profile/update_name.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import 'package:thuctapcoso/utlis/constants/text_strings.dart';
import 'package:thuctapcoso/utlis/validators/validation.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      /// Custom AppBar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              'Use real name for easy verification. This name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Text field and Button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => TValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: TTexts.firstName, prefixIcon: Icon(Icons.person)),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputField),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => TValidator.validateEmptyText('Last name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: TTexts.lastName, prefixIcon: Icon(Icons.person)),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child: const Text('Update'),
              ),
            ),
          ],
        ),
        
      ),
    );
  }
}

