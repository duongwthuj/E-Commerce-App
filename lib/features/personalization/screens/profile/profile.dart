import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/common/widgets/images/t_circular_image.dart';
import 'package:thuctapcoso/common/widgets/texts/sectionsHeading.dart';
import 'package:thuctapcoso/features/personalization/controllers/user_controllers.dart';
import 'package:thuctapcoso/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:thuctapcoso/features/personalization/screens/profile/widgets/profile_menu.dart';

import '../../../../utlis/constants/image_strings.dart';
import '../../../../utlis/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
        appBar: const TAppBar(
          showBackArrow: true,
          title: Text('Profile', style: TextStyle(fontSize: 20)),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        const TCircularImage(
                            image: TImages.user, height: 80, width: 80),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Change profile picture"),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems ),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems * 2.5),
                  const TSectionsHeading(title: "Profile Information", showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems * 2.5),

                  TProfileMenu(title: 'name', value: controller.user.value.fullName, onPressed: () => Get.to(() => ChangeNameScreen()),),
                  TProfileMenu(title: 'username', value: controller.user.value.username, onPressed: () {},),

                  const SizedBox(height: TSizes.spaceBtwItems * 2.5),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems * 2.5),

                  TProfileMenu(title: 'User ID', value: controller.user.value.id, onPressed: () {},),
                  TProfileMenu(title: 'Email', value: controller.user.value.email, onPressed: () {},),
                  TProfileMenu(title: 'phonenumber', value: controller.user.value.phoneNumber, onPressed: () {},),
                  TProfileMenu(title: 'gender', value: "", onPressed: () {},),
                  TProfileMenu(title: 'Date Of Birth', value:"", onPressed: () {},),


                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems * 2.5),

                  Center(
                    child: TextButton(
                      onPressed: () => controller.deleteAccountWarning(),
                      child: const Text("Close Account", style: TextStyle(color: Colors.red))
                    )
                  )
                ]))));
  }
}

