import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/features/personalization/controllers/user_controllers.dart';
import 'package:thuctapcoso/utlis/constants/colors.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import 'package:thuctapcoso/utlis/helpers/helper_functions.dart';
import 'package:thuctapcoso/utlis/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Re-Authenticate User'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: dark ? TColors.black : TColors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Center(
                child: Icon(
                  Icons.security,
                  size: 80,
                  color: dark ? TColors.white : TColors.primary,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                'Verify Your Identity',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                'For security reasons, please verify your identity before proceeding.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Form
              Form(
                key: controller.reAuthFormKey,
                child: Column(
                  children: [
                    // Email
                    TextFormField(
                      controller: controller.verifyEmail,
                      validator: TValidator.validateEmail,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(TSizes.inputFieldRadius),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(TSizes.inputFieldRadius),
                          borderSide: BorderSide(
                            color: dark ? TColors.darkGrey : TColors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(TSizes.inputFieldRadius),
                          borderSide: BorderSide(
                            color: TColors.primary,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputField),

                    // Password
                    Obx(
                      () => TextFormField(
                        controller: controller.verifyPassword,
                        validator: (value) =>
                            TValidator.validateEmptyText('Password', value),
                        obscureText: controller.hidePassword.value,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            onPressed: () => controller.hidePassword.value =
                                !controller.hidePassword.value,
                            icon: Icon(
                              controller.hidePassword.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(TSizes.inputFieldRadius),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(TSizes.inputFieldRadius),
                            borderSide: BorderSide(
                              color: dark ? TColors.darkGrey : TColors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(TSizes.inputFieldRadius),
                            borderSide: BorderSide(
                              color: TColors.primary,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    // Verify Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>
                            controller.reAuthenticateEmailAndPasswordUser(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TColors.primary,
                          foregroundColor: TColors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: TSizes.buttonHeight),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(TSizes.buttonRadius),
                          ),
                        ),
                        child: const Text('Verify'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
