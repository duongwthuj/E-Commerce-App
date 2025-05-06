import 'package:flutter/material.dart';
import 'package:thuctapcoso/utlis/device/device_utility.dart';
import 'package:thuctapcoso/utlis/helpers/helpFunction.dart';
import '../../../utlis/constants/colors.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Material(
      color: dark ? Colors.black : Colors.white,
      child: TabBar(
        indicatorColor: TColors.grey,
        labelColor: dark ? TColors.white : TColors.black,
        unselectedLabelColor: TColors.darkerGrey,
        tabs: tabs,
        isScrollable: true,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}