import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/custom_shapes/containers/round_container.dart';
import 'package:thuctapcoso/features/personalization/models/address_model.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';
import 'package:thuctapcoso/utlis/helpers/helpFunction.dart';
import 'package:thuctapcoso/utlis/constants/colors.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({
    super.key,
    required this.address,
    required this.selectedAddress,
    required this.onTap,
    required this.onDelete,
  });

  final AddressModel address;
  final bool selectedAddress;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? TColors.primary.withOpacity(0.1)
          : Colors.transparent,
      borderColor: selectedAddress
          ? TColors.primary
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
              selectedAddress ? Icons.check_circle : null,
              color: selectedAddress ? TColors.primary : null,
            ),
          ),
          Positioned(
            right: 5,
            bottom: 5,
            child: IconButton(
              icon: const Icon(Icons.delete_outline, color: TColors.error),
              onPressed: onDelete,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(TSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: selectedAddress ? TColors.primary : null,
                        ),
                  ),
                  const SizedBox(height: TSizes.sm / 2),
                  Text(
                    address.formattedPhoneNo,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: selectedAddress ? TColors.primary : null,
                    ),
                  ),
                  const SizedBox(height: TSizes.sm / 2),
                  Text(
                    '${address.street}, ${address.city}, ${address.state} ${address.postalCode}, ${address.country}',
                    softWrap: true,
                    style: TextStyle(
                      color: selectedAddress ? TColors.primary : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
