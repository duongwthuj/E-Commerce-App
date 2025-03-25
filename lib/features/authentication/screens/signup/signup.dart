import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/login_sign_up/form_divider.dart';
import 'package:thuctapcoso/common/widgets/login_sign_up/social_buttons.dart';
import 'package:thuctapcoso/features/authentication/screens/signup/widget/sigup_form.dart';
import 'package:thuctapcoso/utlis/constants/colors.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import 'package:thuctapcoso/utlis/helpers/helpFunction.dart';
import '../../../../utlis/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

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

