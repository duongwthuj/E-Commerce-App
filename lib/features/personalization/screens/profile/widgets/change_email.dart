import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/features/personalization/controllers/update_profile/update_email.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import 'package:thuctapcoso/utlis/validators/validation.dart';

class ChangeEmailScreen extends StatelessWidget {
  const ChangeEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateEmailController());
    return Scaffold(
      /// Custom AppBar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Change Email',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              'Update your email address. This will be used for account recovery and notifications.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Email Verification Status
            Obx(() {
              final isVerified = controller.emailVerified.value;
              return Container(
                padding: const EdgeInsets.all(TSizes.md),
                decoration: BoxDecoration(
                  color: isVerified
                      ? Colors.green.withOpacity(0.1)
                      : Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                ),
                child: Row(
                  children: [
                    Icon(
                      isVerified ? Icons.verified : Icons.warning_amber_rounded,
                      color: isVerified ? Colors.green : Colors.orange,
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    Expanded(
                      child: Text(
                        isVerified
                            ? 'Your email is verified'
                            : 'Please verify your email address',
                        style: TextStyle(
                          color: isVerified ? Colors.green : Colors.orange,
                        ),
                      ),
                    ),
                    if (!isVerified)
                      TextButton(
                        onPressed: () async {
                          try {
                            final user = controller.auth.currentUser;
                            if (user != null) {
                              await user.sendEmailVerification();
                              Get.snackbar(
                                'Verification Email Sent',
                                'Please check your inbox and click the verification link to complete the process.',
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            }
                          } catch (e) {
                            Get.snackbar(
                              'Error',
                              'Failed to send verification email. Please try again.',
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        },
                        child: const Text('Resend'),
                      ),
                  ],
                ),
              );
            }),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Text field and Button
            Form(
              key: controller.updateEmailFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.email,
                    validator: (value) => TValidator.validateEmail(value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateEmail(),
                child: const Text('Update'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
