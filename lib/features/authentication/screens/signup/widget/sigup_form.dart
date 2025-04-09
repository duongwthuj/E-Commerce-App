import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:thuctapcoso/features/authentication/screens/signup/widget/terms_and_confirm.dart';
import '../../../../../utlis/constants/sizes.dart';
import '../../../../../utlis/constants/text_strings.dart';
import '../../../../../utlis/helpers/helpFunction.dart';
import '../verify_email.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    labelText: TTexts.firstName,
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputField, width: 3),
              Expanded(
                child: TextFormField(
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
          TextField(
            expands: false,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person_add_alt_1),
              labelText: TTexts.userName,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputField),
          // Email
          TextField(
            expands: false,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email),
              labelText: TTexts.email,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputField),
          // Phone Number
          TextField(
            expands: false,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.phone),
              labelText: TTexts.phoneNumber,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputField),
          // Password
          TextField(
            expands: false,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              labelText: TTexts.password,
              suffixIcon: const Icon(Icons.visibility_off),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputField),

          // Confirm the terms
          TermsAndConfrim(),

          const SizedBox(height: TSizes.spaceBtwItems),
          // Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => {
                Get.to(() => const VerifyEmailScreen())
              },
              child: Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}

