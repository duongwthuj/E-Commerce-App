import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:thuctapcoso/common/widgets/success_screen/success_screen.dart';
import 'package:thuctapcoso/features/authentication/screens/login/login.dart';
import 'package:thuctapcoso/utlis/constants/text_strings.dart';
import '../../../../utlis/constants/image_strings.dart';
import '../../../../utlis/constants/sizes.dart';
import '../../../../utlis/helpers/helpFunction.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () =>
              Get.offAll(LoginScreen()), icon: const Icon(Icons.close)

          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(
                image: const AssetImage(TImages.test),
                width: THelperFunction.screenWidth() * 0.6,
              ),

              // Title & Subtitle
              Text(
                  TTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
              ),

              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                "support@thuctapcoso.com",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TTexts.confirmEmailSub,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: TSizes.spaceBtwSections),
              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => SuccessScreen(
                    image: TImages.test,
                    title: TTexts.yourAccountIsCreatedSub,
                    subtitle: TTexts.yourAccountIsCreatedTitle,
                    onPressed: () => Get.to(() => const LoginScreen()),
                  )),
                  child: Text(TTexts.tcontinue),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              // Resend email
              TextButton(
                onPressed: () {},
                child: Text(TTexts.resendEmail),
              ),
            ]
          )
        )
      )
    );
  }
}
