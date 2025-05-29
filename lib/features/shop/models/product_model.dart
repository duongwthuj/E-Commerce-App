import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thuctapcoso/features/shop/models/brand_model.dart';
import 'package:thuctapcoso/features/shop/models/product_attribute_model.dart';
import 'package:thuctapcoso/features/shop/models/product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariants;

  ProductModel({
    required this.id,
    required this.stock,
    this.sku,
    required this.price,
    required this.title,
    this.date,
    this.salePrice = 0,
    required this.thumbnail,
    this.isFeatured,
    this.brand,
    this.description,
    this.categoryId,
    this.images,
    this.productType = "",
    this.productAttributes,
    this.productVariants,
  });

  static ProductModel empty() => ProductModel(
        id: "",
        stock: 0,
        price: 0,
        title: "",
        thumbnail: "",
        salePrice: 0,
        isFeatured: false,
        description: "",
        categoryId: "",
        images: [],
        productType: "",
        productAttributes: [],
        productVariants: [],
        brand: BrandModel.empty(),
      );

  toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand?.toJson(),
      'Description': description,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      'ProductVariants': productVariants != null
          ? productVariants!.map((e) => e.toJson()).toList()
          : [],
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) {
      return ProductModel.empty();
    }
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      sku: data['SKU'],
      title: data['Title'] ?? '',
      stock: data['Stock'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: data['Brand'] != null
          ? BrandModel.fromJson(data['Brand'])
          : BrandModel.empty(),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: data['ProductAttributes'] != null
          ? (data['ProductAttributes'] as List<dynamic>)
              .map((e) => ProductAttributeModel.fromJson(e))
              .toList()
          : [],
      productVariants: data['ProductVariants'] != null
          ? (data['ProductVariants'] as List<dynamic>)
              .map((e) => ProductVariationModel.fromJson(e))
              .toList()
          : [],
    );
  }

  static ProductModel fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['Id'] ?? '',
      stock: json['Stock'] ?? 0,
      price: json['Price'] ?? 0.0,
      title: json['Title'] ?? '',
      thumbnail: json['Thumbnail'] ?? '',
      sku: json['SKU'],
      isFeatured: json['IsFeatured'] ?? false,
      salePrice: json['SalePrice'] ?? 0.0,
      categoryId: json['CategoryId'],
      description: json['Description'],
      productType: json['ProductType'] ?? '',
      brand: json['Brand'] != null
          ? BrandModel.fromJson(json['Brand'])
          : BrandModel.empty(),
      images: json['Images'] != null ? List<String>.from(json['Images']) : [],
      productAttributes: json['ProductAttributes'] != null
          ? (json['ProductAttributes'] as List<dynamic>)
              .map((e) => ProductAttributeModel.fromJson(e))
              .toList()
          : [],
      productVariants: json['ProductVariants'] != null
          ? (json['ProductVariants'] as List<dynamic>)
              .map((e) => ProductVariationModel.fromJson(e))
              .toList()
          : [],
    );
  }
}
