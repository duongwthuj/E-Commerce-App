import 'package:flutter/material.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/features/shop/screens/order/widget/orders_list.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: TAppBar(
          title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: const Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: TOrderListItems(),
        )
      );
  }
}