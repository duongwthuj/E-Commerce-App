import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/custom_shapes/containers/round_container.dart';
import 'package:thuctapcoso/utlis/constants/colors.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import 'package:thuctapcoso/utlis/helpers/helper_functions.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });

  

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
        showBorder: true,
        backgroundColor: dark ? TColors.dark : TColors.white,
        padding: const EdgeInsets.only(
            top: TSizes.sm,
            bottom: TSizes.sm,
            right: TSizes.sm,
            left: TSizes.md),
        child: Row(
          children: [
            Flexible(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Have a coupon?',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
                width: 80,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        foregroundColor: dark ? TColors.white.withOpacity(0.5) : TColors.black.withOpacity(0.5),
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        side: BorderSide(color: Colors.grey.withOpacity(0.1))
                    ),
                    child: const Text('Apply')
                )
            )
          ],
        ));
  }
}