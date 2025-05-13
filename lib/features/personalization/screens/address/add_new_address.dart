import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Add new Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone_android_outlined),
                    labelText: 'Phone Number',
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.home_outlined),
                          labelText: 'Street',
                        ),
                      ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.numbers),
                          labelText: 'Postal Code',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.location_city_outlined),
                          labelText: 'City',
                        ),
                      ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.map_outlined),
                          labelText: 'State',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.public_outlined),
                    labelText: 'Country',
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
