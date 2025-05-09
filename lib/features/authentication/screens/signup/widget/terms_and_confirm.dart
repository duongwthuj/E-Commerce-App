import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../utlis/constants/colors.dart';
import '../../../../../utlis/constants/text_strings.dart';
import '../../../../../utlis/helpers/helpFunction.dart';

class TermsAndConfrim extends StatelessWidget {
  const TermsAndConfrim({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(value: false, onChanged: (value) {}),
        ),
        // const SizedBox(width: TSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: TTexts.iAgreeTo,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                  text: TTexts.privacyPolicy,
                  style: Theme.of(context).textTheme.bodySmall?.apply(
                    color: dark ? TColors.white : TColors.dark,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.dark,
                  )
              ),
              TextSpan(
                text: TTexts.and,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                  text: TTexts.termsOfUse,
                  style: Theme.of(context).textTheme.bodySmall?.apply(
                    color: dark ? TColors.white : TColors.dark,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.dark,
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }
}