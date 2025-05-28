import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/features/authentication/controllers/login/login_controller.dart';
import 'package:thuctapcoso/navigation_menu.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import 'package:thuctapcoso/utlis/constants/text_strings.dart';
import 'package:thuctapcoso/utlis/validators/validation.dart';
import '../../signup/signup.dart';
import '../../password_configuration/forgot_password_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
        child: Column(
          children: [
            // email
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: TTexts.email,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputField),
            // password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  labelText: TTexts.password,
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputField / 2),
            // Remember me & Forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) =>
                            controller.rememberMe.value = value!,
                      ),
                    ),
                    Text(TTexts.rememberMe),
                  ],
                ),
                // Forgot password
                TextButton(
                  onPressed: () => Get.to(() => ForgotPasswordScreen()),
                  child: Text(TTexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            // login button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: Text(TTexts.signIn),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            // Create account
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(TTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
