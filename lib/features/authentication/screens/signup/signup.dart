import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/login_sign_up/form_divider.dart';
import 'package:thuctapcoso/common/widgets/login_sign_up/social_buttons.dart';
import 'package:thuctapcoso/features/authentication/screens/signup/widget/sigup_form.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import 'package:thuctapcoso/utlis/helpers/helpFunction.dart';
import '../../../../utlis/constants/image_strings.dart';
import '../../../../utlis/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              Center(
                child: Image(
                  height: 100,
                  image: AssetImage(
                      dark ? TImages.darkAppLogo : TImages.lightAppLogo),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              // Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              // Form
              const SignUpForm(),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Divider
              FormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Social Buttons
              const SocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
