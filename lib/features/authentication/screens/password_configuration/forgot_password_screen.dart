import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/forgot_password/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final ForgotPasswordController controller =
      Get.put(ForgotPasswordController());
  final TextEditingController emailController = TextEditingController();

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter your email address to reset your password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            Obx(() => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () => controller
                          .sendPasswordResetEmail(emailController.text),
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text('Send Reset Link'),
                )),
          ],
        ),
      ),
    );
  }
}
