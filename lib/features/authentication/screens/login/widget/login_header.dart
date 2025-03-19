import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../utlis/constants/image_strings.dart';
import '../../../../../utlis/constants/sizes.dart';
import '../../../../../utlis/constants/text_strings.dart';
import '../../../../../utlis/helpers/helpFunction.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // logo
        Image(
          height: 125,
          image: AssetImage(dark ? TImages.darkAppLogo : TImages.lightAppLogo),
        ),
        Text(
          TTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: TSizes.sm),
        Text(
          TTexts.loginSubtitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),

        // title
        // sub title
      ],
    );
  }
}
