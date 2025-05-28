import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import 'package:thuctapcoso/utlis/constants/text_strings.dart';
import 'package:thuctapcoso/utlis/validators/validation.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final ForgotPasswordController controller =
      Get.put(ForgotPasswordController());
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Forgot Password',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Text(
                'Enter your email address to reset your password',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              TextFormField(
                controller: emailController,
                validator: (value) => TValidator.validateEmail(value),
                decoration: const InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      controller.sendPasswordResetEmail(emailController.text);
                    }
                  },
                  child: const Text('Send Reset Link'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
