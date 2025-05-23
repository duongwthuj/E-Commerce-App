import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/features/authentication/controllers/signup/sigunup_controller.dart';
import 'package:thuctapcoso/features/authentication/screens/signup/widget/terms_and_confirm.dart';
import 'package:thuctapcoso/utlis/validators/validation.dart';
import '../../../../../utlis/constants/sizes.dart';
import '../../../../../utlis/constants/text_strings.dart';
// import '../../../../../utlis/helpers/helpFunction.dart';
// import '../verify_email.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      TValidator.validateEmpty('first name', value),
                  expands: false,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    labelText: TTexts.firstName,
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputField),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      TValidator.validateEmpty('last name', value),
                  expands: false,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    labelText: TTexts.lastName,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputField),
          // Username
          TextFormField(
            controller: controller.username,
            validator: (value) => TValidator.validateEmpty('username', value),
            expands: false,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person_add_alt_1),
              labelText: TTexts.userName,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputField),
          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            expands: false,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email),
              labelText: TTexts.email,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputField),
          // Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            expands: false,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.phone),
              labelText: TTexts.phoneNo,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputField),
          // Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              expands: false,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                labelText: TTexts.password,
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: controller.hidePassword.value
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputField),

          // Confirm the terms
          const TermsAndConfrim(),

          const SizedBox(height: TSizes.spaceBtwItems),
          // Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => {
                controller.signup(),
              },
              child: Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
