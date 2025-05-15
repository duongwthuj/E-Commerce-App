import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/common/widgets/custom_shapes/containers/round_container.dart';
import 'package:thuctapcoso/common/widgets/products/cart/coupon_widget.dart';
import 'package:thuctapcoso/common/widgets/success_screen/success_screen.dart';
import 'package:thuctapcoso/features/shop/screens/cart/widget/cart_items.dart';
import 'package:thuctapcoso/features/shop/screens/checkout/widget/biliing_payment_section.dart';
import 'package:thuctapcoso/features/shop/screens/checkout/widget/billing_address_section.dart';
import 'package:thuctapcoso/features/shop/screens/checkout/widget/billingg_amount_section.dart';
import 'package:thuctapcoso/navigation_menu.dart';
import 'package:thuctapcoso/utlis/constants/colors.dart';
import 'package:thuctapcoso/utlis/constants/image_strings.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import 'package:thuctapcoso/utlis/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text('Order Review',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in Cart
              const TCartItems(showAddRemoveButton: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Coupon TextField
              TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.dark : TColors.white,
                child: Column(
                  children: [
                    TBillingAmountSection(),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    TBillingPaymentSection(),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    TBillingAddressSection(),
                    const SizedBox(height: TSizes.spaceBtwSections),

                  ]
                )
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace), 
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
            image: TImages.successfulPaymentIcon,
            title: 'Order Placed Successfully', 
            subtitle: 'Your order has been placed successfully', 
            onPressed: () => Get.offAll(() => const NavigationMenu())
            )), 
          child: Text('Checkout \$256.0', style: Theme.of(context).textTheme.bodyLarge)
        ),
      ),
    );
  }
}


