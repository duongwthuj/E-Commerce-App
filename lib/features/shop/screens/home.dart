import 'package:flutter/material.dart';
import '../../../common/custom_shapes/containers/circular_container.dart';
import '../../../common/custom_shapes/containers/curved_edges/curved_edges.dart';
import '../../../common/custom_shapes/containers/curved_edges/primary_hearder_container.dart';
import '../../../utlis/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Container(
                  color: TColors.primary,
                  padding: const EdgeInsets.all(0),
                  child: SizedBox(
                    height: 340,
                    child: Stack(
                        children: [
                          Positioned(
                            top : -150,
                            right: -250,
                            child: CircularContainer(
                              backgroundColor: TColors.textWhite.withOpacity(0.1),
                            ),
                          ),
                          Positioned(
                            top: 200,
                            right: 250,
                            child: CircularContainer(
                              backgroundColor: TColors.textWhite.withOpacity(0.2),
                            ),
                          ),

                        ]

                    ),
                  )
              ),
            )
          ],
        )
      )
    );
  }
}




