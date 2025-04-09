import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/styles/spacing_styles.dart';
import 'package:thuctapcoso/features/authentication/screens/login/widget/login_form.dart';
import 'package:thuctapcoso/features/authentication/screens/login/widget/login_header.dart';
import 'package:thuctapcoso/utlis/constants/text_strings.dart';
import '../../../../common/widgets/login_sign_up/form_divider.dart';
import '../../../../common/widgets/login_sign_up/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // logo, title & sub title
              LoginHeader(),

              // Form
              LoginForm(),

              // Divider
              FormDivider(dividerText: TTexts.orSignInWith.capitalize!),

              // Footer
              SocialButton()
            ],
          ),
        ),
      ),
    );
  }
}
