import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thuctapcoso/utlis/helpers/helpFunction.dart';
import '../../../utlis/constants/colors.dart';


class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key, required this.dividerText,
  });
  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Flexible(
          child: Divider(
            color: dark ? TColors.darkGrey : TColors.lightGrey,
            thickness: 0.5,
            indent: 60,
            endIndent: 10,
          )),
      Text(
        dividerText,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      Flexible(
          child: Divider(
            color: dark ? TColors.darkGrey : TColors.lightGrey,
            thickness: 0.5,
            indent: 60,
            endIndent: 10,
          )),
    ]);
  }
}