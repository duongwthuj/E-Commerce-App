import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/common/widgets/list_tiles/settings_menu_title.dart';
import 'package:thuctapcoso/common/widgets/texts/sectionsHeading.dart';
import 'package:thuctapcoso/data/repositories/anthentications/authentication_repository.dart';
import 'package:thuctapcoso/features/personalization/screens/address/address.dart';
import 'package:thuctapcoso/features/shop/screens/order/order.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_hearder_container.dart';
import '../../../../common/widgets/list_tiles/user_profile_title.dart';
import '../../../../utlis/constants/colors.dart';
import '../../../../utlis/constants/sizes.dart';
import '../../../../utlis/constants/text_strings.dart';

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
              title: Text(TTexts.account,
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
                  title: TTexts.accountSettings,
                  showActionButton: false,
                ),
                SizedBox(height: TSizes.defaultSpace),
                TSettingsMenuTile(
                    icon: Icons.location_on_outlined,
                    title: TTexts.myAddress,
                    subtitle: TTexts.setShoppingDeliveryAddress,
                    onTap: () => Get.to(() => const UserAddressScreen())),
                TSettingsMenuTile(
                  icon: Icons.shopping_cart_outlined,
                  title: TTexts.myCart,
                  subtitle: TTexts.addRemoveProductsAndMoveToCheckout,
                  onTap: () {},
                ),
                TSettingsMenuTile(
                    icon: Icons.shopping_bag_outlined,
                    title: TTexts.myOrder,
                    subtitle: TTexts.inProgressAndCompletedOrders,
                    onTap: () => Get.to(() => const OrderScreen())),
                TSettingsMenuTile(
                    icon: Icons.account_balance_outlined,
                    title: TTexts.bankAccount,
                    subtitle: TTexts.withdrawBalanceToRegisteredBankAccount,
                    onTap: () {}),
                TSettingsMenuTile(
                    icon: Icons.discount_outlined,
                    title: TTexts.myCoupons,
                    subtitle: TTexts.listOfAllDiscountedCoupons,
                    onTap: () {}),
                TSettingsMenuTile(
                    icon: Icons.notifications_outlined,
                    title: TTexts.notifications,
                    subtitle: TTexts.setAnyKindOfNotificationMessage,
                    onTap: () {}),
                TSettingsMenuTile(
                    icon: Icons.lock_outline,
                    title: TTexts.accountPrivacy,
                    subtitle: TTexts.manageDataUsageAndConnectedAccounts,
                    onTap: () {}),
                SizedBox(height: TSizes.spaceBtwSections),
                TSectionsHeading(
                  title: TTexts.appSettings,
                  showActionButton: false,
                ),
                SizedBox(height: TSizes.defaultSpace),
                TSettingsMenuTile(
                    icon: Icons.cloud_upload_outlined,
                    title: TTexts.loadData,
                    subtitle: TTexts.uploadDataToYourCloudFirebase,
                    onTap: () {}),
                TSettingsMenuTile(
                    icon: Icons.security_outlined,
                    title: TTexts.accountPrivacy,
                    subtitle: TTexts.manageDataUsageAndConnectedAccounts,
                    trailing: Switch(value: true, onChanged: (value) {})),
                TSettingsMenuTile(
                    icon: Icons.shield_outlined,
                    title: TTexts.safeMode,
                    subtitle: TTexts.searchAndViewProductsInSafeMode,
                    trailing: Switch(value: true, onChanged: (value) {})),
                TSettingsMenuTile(
                    icon: Icons.hd_outlined,
                    title: TTexts.hdImageQuality,
                    subtitle: TTexts.setImageQualityToHD,
                    trailing: Switch(value: true, onChanged: (value) {})),
                const SizedBox(height: TSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () =>
                          AuthenticationRepository.instance.logout(),
                      child: Text(TTexts.logout)),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ))
      ],
    )));
  }
}
