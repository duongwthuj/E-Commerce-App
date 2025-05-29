import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/common/widgets/images/t_circular_image.dart';
import 'package:thuctapcoso/common/widgets/texts/sectionsHeading.dart';
import 'package:thuctapcoso/features/personalization/controllers/update_profile/update_date_of_birth.dart';
import 'package:thuctapcoso/features/personalization/controllers/update_profile/update_gender.dart';
import 'package:thuctapcoso/features/personalization/controllers/update_profile/update_profile_picture.dart';
import 'package:thuctapcoso/features/personalization/controllers/user_controllers.dart';
import 'package:thuctapcoso/features/personalization/screens/profile/widgets/change_email.dart';
import 'package:thuctapcoso/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:thuctapcoso/features/personalization/screens/profile/widgets/change_username.dart';
import 'package:thuctapcoso/features/personalization/screens/profile/widgets/profile_menu.dart';

import '../../../../utlis/constants/image_strings.dart';
import '../../../../utlis/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final profilePictureController = Get.put(UpdateProfilePictureController());
    final genderController = Get.put(UpdateGenderController());
    final dateOfBirthController = Get.put(UpdateDateOfBirthController());

    // Refresh user data when screen is loaded
    controller.fetchUserRecord();

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
                        Obx(() => TCircularImage(
                              image: controller
                                      .user.value.profilePicture.isNotEmpty
                                  ? controller.user.value.profilePicture
                                  : TImages.user,
                              height: 80,
                              width: 80,
                              isNetworkImage: controller
                                  .user.value.profilePicture.isNotEmpty,
                            )),
                        TextButton(
                          onPressed: () =>
                              profilePictureController.pickAndUploadImage(),
                          child: const Text("Change profile picture"),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems * 2.5),
                  const TSectionsHeading(
                    title: "Profile Information",
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems * 2.5),
                  TProfileMenu(
                    title: 'name',
                    value: controller.user.value.fullName,
                    onPressed: () => Get.to(() => const ChangeNameScreen()),
                  ),
                  TProfileMenu(
                    title: 'username',
                    value: controller.user.value.username,
                    onPressed: () => Get.to(() => const ChangeUsernameScreen()),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems * 2.5),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems * 2.5),
                  TProfileMenu(
                    title: 'User ID',
                    value: controller.user.value.id,
                    onPressed: () {},
                  ),
                  TProfileMenu(
                    title: 'Email',
                    value: controller.user.value.email,
                    onPressed: () => Get.to(() => const ChangeEmailScreen()),
                  ),
                  TProfileMenu(
                    title: 'phonenumber',
                    value: controller.user.value.phoneNumber,
                    onPressed: () {},
                  ),
                  Obx(() => TProfileMenu(
                    title: 'Gender',
                    value: genderController.selectedGender.value.isEmpty 
                        ? 'Select Gender' 
                        : genderController.selectedGender.value,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Select Gender'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                title: const Text('Male'),
                                onTap: () {
                                  genderController.updateGender('Male');
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                title: const Text('Female'),
                                onTap: () {
                                  genderController.updateGender('Female');
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                title: const Text('Other'),
                                onTap: () {
                                  genderController.updateGender('Other');
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
                  Obx(() => TProfileMenu(
                    title: 'Date Of Birth',
                    value: dateOfBirthController.selectedDate.value.isEmpty 
                        ? 'Select Date' 
                        : dateOfBirthController.selectedDate.value,
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: dateOfBirthController.selectedDate.value.isEmpty
                            ? DateTime.now()
                            : DateTime.parse(dateOfBirthController.selectedDate.value),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        final formattedDate =
                            "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
                        dateOfBirthController.updateDateOfBirth(formattedDate);
                      }
                    },
                  )),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems * 2.5),
                  Center(
                      child: TextButton(
                          onPressed: () => controller.deleteAccountWarning(),
                          child: const Text("Close Account",
                              style: TextStyle(color: Colors.red))))
                ]))));
  }
}
