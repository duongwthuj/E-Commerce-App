import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/features/personalization/screens/address/add_new_address.dart';
import 'package:thuctapcoso/features/personalization/screens/address/widget/single_address.dart';
import 'package:thuctapcoso/utlis/constants/colors.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary, 
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Icons.add, color: TColors.white),
      
        ),
        appBar: TAppBar(
          showBackArrow: true, 
          title: Text('Address', style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                  TSingleAddress(selectedAddress: true),
                  TSingleAddress(selectedAddress: false),
                  TSingleAddress(selectedAddress: false),
                  TSingleAddress(selectedAddress: false),
                  TSingleAddress(selectedAddress: false),
                  TSingleAddress(selectedAddress: false),
                  TSingleAddress(selectedAddress: false),
                  TSingleAddress(selectedAddress: false),
              ],
            ),
          )
        )

    );
  }
}