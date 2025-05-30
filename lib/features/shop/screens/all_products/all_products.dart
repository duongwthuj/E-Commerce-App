import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctapcoso/common/widgets/appbar/appbar.dart';
import 'package:thuctapcoso/common/widgets/products/sortable/sortable_products.dart';
import 'package:thuctapcoso/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:thuctapcoso/features/shop/controllers/all_product_controllers.dart';
import 'package:thuctapcoso/features/shop/models/product_model.dart';
import 'package:thuctapcoso/utlis/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({
    super.key,
    required this.title,
    this.query,
    this.futureMethod,
  });

  final String? title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    return Scaffold(
      appBar: TAppBar(
        title: Text(title ?? 'Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder<List<ProductModel>>(
            future: futureMethod ??
                controller.fetchProductQuery(
                  query ?? FirebaseFirestore.instance.collection('Products'), // Sửa thành 'Products'
                ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const TVerticalProductShimmer();
              }
              if (snapshot.hasError) {
                print('Error: ${snapshot.error}'); // Log lỗi
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                print('No products found'); // Log trạng thái rỗng
                return const Center(child: Text('No products found'));
              }
              final products = snapshot.data!;
              print('Loaded ${products.length} products'); // Log số sản phẩm
              return TSoretableProducts(products: products);
            },
          ),
        ),
      ),
    );
  }
}