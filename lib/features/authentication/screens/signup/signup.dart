import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/login_sign_up/form_divider.dart';
import 'package:thuctapcoso/common/widgets/login_sign_up/social_buttons.dart';
import 'package:thuctapcoso/features/authentication/screens/signup/widget/sigup_form.dart';
import 'package:thuctapcoso/utlis/constants/colors.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            TSizes.defaultSpace, // Trái
            0,                  // Trên
            TSizes.defaultSpace, // Phải
            TSizes.defaultSpace, // Dưới
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              Image(
                height: 80,
                image: AssetImage(dark ? TImages.darkAppLogo : TImages.lightAppLogo),
              ),
              const SizedBox(height: TSizes.sm),
              // Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              // Form
              SignUpForm(),
              // Divider
              FormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              // Social Buttons
              const SocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}