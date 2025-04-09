import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/product_cart/cart_menu_icon.dart';
import '../../../../utlis/constants/colors.dart';
import '../../../../utlis/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TTexts.homeAppBarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColors.grey),
            ),
            Text(
              TTexts.homeAppBarSubTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.grey),
            ),
          ],
        ),
        actions: [
          TCartCounterIcon(
            onPressed: () {},
            IconColor: TColors.white,
          )

        ]
    );
  }
}
