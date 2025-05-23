import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/features/authentication/controllers/signup/sigunup_controller.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import '../../../../../utlis/constants/colors.dart';
import '../../../../../utlis/constants/text_strings.dart';
import '../../../../../utlis/helpers/helpFunction.dart';

class TermsAndConfrim extends StatelessWidget {
  const TermsAndConfrim({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = THelperFunction.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) {
                  controller.privacyPolicy.value = value ?? false;
                },
              )),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Expanded(
          child: Text.rich(
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
                      ),
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
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
