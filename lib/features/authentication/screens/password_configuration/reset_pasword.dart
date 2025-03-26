import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:thuctapcoso/utlis/constants/image_strings.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../utlis/constants/sizes.dart';
import '../../../../utlis/constants/text_strings.dart';
import '../../../../utlis/helpers/helpFunction.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions:[
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.close)
          )
        ]
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column (
            children: [Image(
              image: const AssetImage(TImages.test),
              width: THelperFunction.screenWidth() * 0.6,
            ),

              // Title & Subtitle
              Text(
                TTexts.changePasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),


              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TTexts.changePasswordSubtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: TSizes.spaceBtwSections),
              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(TTexts.done),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: Text(TTexts.resendEmail),
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}
