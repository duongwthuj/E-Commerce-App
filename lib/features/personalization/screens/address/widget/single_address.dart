import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/custom_shapes/containers/round_container.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import 'package:thuctapcoso/utlis/helpers/helpFunction.dart';
import 'package:thuctapcoso/utlis/constants/colors.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress ? TColors.primary : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? TColors.darkGrey
              : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Icons.check_circle_outlined : null,
              color: selectedAddress
                  ? dark
                      ? TColors.light
                      : TColors.dark
                  : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: TSizes.sm / 2),
                const Text('(+123) 456 7890',
                    maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: TSizes.sm / 2),
                const Text('82356 Timmy Coves, South Liana, Maine, 87665, USA',
                    softWrap: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
