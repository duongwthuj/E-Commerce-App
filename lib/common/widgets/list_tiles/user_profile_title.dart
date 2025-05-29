import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/features/personalization/controllers/user_controllers.dart';
import 'package:thuctapcoso/features/personalization/screens/profile/profile.dart';
import '../../../utlis/constants/colors.dart';
import '../../../utlis/constants/image_strings.dart';
import '../images/t_circular_image.dart';

class TUserProfileTitle extends StatelessWidget {
  const TUserProfileTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
        leading: Obx(() => TCircularImage(
              image: controller.user.value.profilePicture ?? TImages.user,
              width: 50,
              height: 50,
              padding: 0,
              isNetworkImage: controller.user.value.profilePicture != null,
            )),
        title: Text(controller.user.value.fullName,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.white)),
        subtitle: Text(controller.user.value.email,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .apply(color: TColors.white)),
        trailing: IconButton(
            // chuyen sang trang sua thong tin ca nhan bang get
            onPressed: () => {Get.to(() => const ProfileScreen())},
            icon: const Icon(Icons.edit, color: TColors.white)));
  }
}
