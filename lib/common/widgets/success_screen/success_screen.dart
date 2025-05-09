import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/styles/spacing_styles.dart';
import '../../../utlis/constants/sizes.dart';
import '../../../utlis/constants/text_strings.dart';
import '../../../utlis/helpers/helpFunction.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle, required this.onPressed});

  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: TSpacingStyle.paddingWithAppBarHeight * 2,
            child: Column (
              children: [Image(
                image: AssetImage(image),
                width: THelperFunction.screenWidth() * 0.6,
              ),

                // Title & Subtitle
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),


                const SizedBox(height: TSizes.spaceBtwItems),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: TSizes.spaceBtwSections),
                // Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    child: Text(TTexts.skip),
                  ),
                ),
              ],
            ),
        ),
      )
    );
  }
}
