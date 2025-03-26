import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/features/authentication/screens/password_configuration/reset_pasword.dart';
import 'package:thuctapcoso/utlis/constants/image_strings.dart';
import 'package:thuctapcoso/utlis/helpers/helpFunction.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../utlis/constants/sizes.dart';
import '../../../../utlis/constants/text_strings.dart';
import '../login/login.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions:[
          IconButton(
            onPressed: () => Get.offAll(LoginScreen()),
            icon: const Icon(Icons.close)
          )
        ]
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children :[
              // Headings
              Image(
                height: 125,
                image: AssetImage(dark ? TImages.darkAppLogo : TImages.lightAppLogo),
              ),
              Text(
                TTexts.forgetPassword,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TTexts.forgetPasswordSubtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems * 2),
              // Text Field
              TextField(
                decoration: const InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.off(() => const ResetPasswordScreen()),
                  child: Text(TTexts.send),
                ),
              )
            ]
          )
        )
      )

    );
  }
}

