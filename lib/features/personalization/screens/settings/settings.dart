import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/common/widgets/list_tiles/settings_menu_title.dart';
import 'package:thuctapcoso/common/widgets/texts/sectionsHeading.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_hearder_container.dart';
import '../../../../common/widgets/list_tiles/user_profile_title.dart';
import '../../../../utlis/constants/colors.dart';
import '../../../../utlis/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        // Header
        PrimaryHeaderContainer(
            child: Column(children: [
          // appBar
          TAppBar(
              title: Text('Account',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .apply(color: TColors.white))),

          // User Profile Card
          TUserProfileTitle(),
          const SizedBox(height: TSizes.spaceBtwSections),
        ])),
        // Body
        Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                TSectionsHeading(
                  title: "Account Settings",
                  showActionButton: false,
                ),
                SizedBox(height: TSizes.defaultSpace),
                TSettingsMenuTile(
                    icon: Icons.location_on,
                    title: "My Address",
                    subtitle: "Set shopping delivery address",
                    onTap: () {}),
                TSettingsMenuTile(
                    icon: Icons.location_on,
                    title: "My cart",
                    subtitle: "Add, remove products and move to checkout",
                    onTap: () {}),
                TSettingsMenuTile(
                    icon: Icons.location_on,
                    title: "My Order",
                    subtitle: "In progress and Completed Orders",
                    onTap: () {}),
                TSettingsMenuTile(
                    icon: Icons.location_on,
                    title: "Bank Account",
                    subtitle: "Withdraw balance to registered bank account",
                    onTap: () {}),
                TSettingsMenuTile(
                    icon: Icons.location_on,
                    title: "My Coupons",
                    subtitle: "List of all the discounted coupons",
                    onTap: () {}),
                TSettingsMenuTile(
                    icon: Icons.location_on,
                    title: "Notifications",
                    subtitle: "Set any kind of notification message",
                    onTap: () {}),
                TSettingsMenuTile(
                    icon: Icons.location_on,
                    title: "Account Privacy",
                    subtitle: "Manage date usage and connected accounts",
                    onTap: () {}),
                SizedBox(height: TSizes.spaceBtwSections),
                TSectionsHeading(
                  title: "App Settings",
                  showActionButton: false,
                ),
                SizedBox(height: TSizes.defaultSpace),
                TSettingsMenuTile(
                    icon: Icons.location_on,
                    title: "Load data",
                    subtitle: "Upload Data to your clound FireBases",
                    onTap: () {}),
                TSettingsMenuTile(
                    icon: Icons.location_on,
                    title: "Account Privacy",
                    subtitle: "Manage date usage and connected accounts",
                    trailing: Switch(value: true, onChanged: (value) {})),
                TSettingsMenuTile(
                    icon: Icons.location_on,
                    title: "Safe mode",
                    subtitle: "Search and view products in safe mode",
                    trailing: Switch(value: true, onChanged: (value) {})),
                TSettingsMenuTile(
                    icon: Icons.location_on,
                    title: "HD Image Quality",
                    subtitle: "Set image quality to HD",
                    trailing: Switch(value: true, onChanged: (value) {})),
                const SizedBox(height: TSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () {}, child: const Text("LogOut")),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ))
      ],
    )));
  }
}
