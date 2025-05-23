import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/data/repositories/anthentications/authentication_repository.dart';
import 'package:thuctapcoso/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:thuctapcoso/utlis/constants/text_strings.dart';
import '../../../../utlis/constants/image_strings.dart';
import '../../../../utlis/constants/sizes.dart';
import '../../../../utlis/helpers/helpFunction.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => AuthenticationRepository.instance.logout(),
                icon: const Icon(Icons.close))
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: Column(children: [
                  // Image
                  Image(
                    image: const AssetImage(TImages.deliveredEmailIllustration),
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
                    email ?? '',
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: TSizes.spaceBtwItems),
                  Text(
                    TTexts.confirmEmailSubTitle,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),
                  // Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Get.to(
                          () => controller.checkEmailVerificationStatus()),
                      child: Text(TTexts.skip),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // Resend email
                  TextButton(
                    onPressed: () => controller.sendEmailVerification(),
                    child: Text(TTexts.resendEmail),
                  ),
                ]))));
  }
}
