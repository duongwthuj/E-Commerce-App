import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/common/widgets/images/t_circular_image.dart';
import 'package:thuctapcoso/common/widgets/texts/sectionsHeading.dart';
import 'package:thuctapcoso/features/personalization/screens/profile/widgets/profile_menu.dart';

import '../../../../utlis/constants/image_strings.dart';
import '../../../../utlis/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

                  TProfileMenu(title: 'name', value:"Duong Thu ", onPressed: () {},),
                  TProfileMenu(title: 'username', value: 'duongthuj', onPressed: () {},),

                  const SizedBox(height: TSizes.spaceBtwItems * 2.5),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems * 2.5),

                  TProfileMenu(title: 'User ID', value: '05012004', onPressed: () {},),
                  TProfileMenu(title: 'Email', value: 'duongthu5104@gmail.com', onPressed: () {},),
                  TProfileMenu(title: 'phonenumber', value: '0384190939', onPressed: () {},),
                  TProfileMenu(title: 'gender', value: 'male', onPressed: () {},),
                  TProfileMenu(title: 'Date Of Birth', value: '05/01/2004', onPressed: () {},),


                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems * 2.5),

                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("Close Account", style: TextStyle(color: Colors.red))
                    )
                  )
                ]))));
  }
}

