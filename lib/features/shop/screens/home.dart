import 'package:flutter/material.dart';
import 'package:thuctapcoso/features/shop/screens/widgets/home_appbar.dart';
import '../../../common/widgets/custom_shapes/containers/primary_hearder_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  THomeAppBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




