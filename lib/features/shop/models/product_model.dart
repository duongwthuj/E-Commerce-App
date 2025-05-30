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

  Map<String, dynamic> toJson() {
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

  static List<String> convertToStringList(dynamic value) {
    if (value == null) return [];
    if (value is List) {
      return value
          .where((e) => e != null)
          .map((e) => e.toString())
          .toList()
          .cast<String>();
    }
    return [];
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot document) {
    if (document.data() == null) {
      print('Tài liệu ${document.id} không có dữ liệu');
      return ProductModel.empty();
    }
    final data = document.data()! as Map<String, dynamic>;

    try {
      return ProductModel(
        id: document.id,
        title: data['Title']?.toString() ?? '',
        description: data['Description']?.toString() ?? '',
        thumbnail: data['Thumbnail']?.toString() ?? '',
        brand: data['Brand'] != null
            ? BrandModel.fromJson(data['Brand'] as Map<String, dynamic>)
            : BrandModel.empty(),
        price: (data['Price'] is num ? data['Price'].toDouble() : 0.0),
        salePrice: (data['SalePrice'] is num ? data['SalePrice'].toDouble() : 0.0),
        sku: data['SKU']?.toString() ?? '',
        categoryId: data['CategoryId']?.toString() ?? '',
        productType: data['ProductType']?.toString() ?? 'single',
        stock: (data['Stock'] is num ? data['Stock'] : 0) as int,
        isFeatured: data['IsFeatured'] as bool? ?? false,
        images: convertToStringList(data['Images']),
        productVariants: data['ProductVariants'] != null &&
                data['ProductVariants'] is List
            ? (data['ProductVariants'] as List)
                .map((item) {
                  try {
                    return ProductVariationModel.fromJson(
                        item as Map<String, dynamic>);
                  } catch (e) {
                    print('Lỗi xử lý ProductVariant trong tài liệu ${document.id}: $e');
                    return null;
                  }
                })
                .where((item) => item != null)
                .cast<ProductVariationModel>()
                .toList()
            : [],
        productAttributes: data['ProductAttributes'] != null &&
                data['ProductAttributes'] is List
            ? (data['ProductAttributes'] as List)
                .map((item) {
                  try {
                    return ProductAttributeModel.fromJson(
                        item as Map<String, dynamic>);
                  } catch (e) {
                    print('Lỗi xử lý ProductAttribute trong tài liệu ${document.id}: $e');
                    return null;
                  }
                })
                .where((item) => item != null)
                .cast<ProductAttributeModel>()
                .toList()
            : [],
      );
    } catch (e) {
      print('Lỗi xử lý tài liệu ${document.id}: $e');
      print('Dữ liệu tài liệu: $data');
      rethrow;
    }
  }

  static ProductModel fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['Id']?.toString() ?? '',
      stock: (json['Stock'] is num ? json['Stock'] : 0) as int,
      price: (json['Price'] is num ? json['Price'].toDouble() : 0.0),
      title: json['Title']?.toString() ?? '',
      thumbnail: json['Thumbnail']?.toString() ?? '',
      sku: json['SKU']?.toString() ?? '',
      isFeatured: json['IsFeatured'] as bool? ?? false,
      salePrice: (json['SalePrice'] is num ? json['SalePrice'].toDouble() : 0.0),
      categoryId: json['CategoryId']?.toString() ?? '',
      description: json['Description']?.toString() ?? '',
      productType: json['ProductType']?.toString() ?? '',
      brand: json['Brand'] != null
          ? BrandModel.fromJson(json['Brand'] as Map<String, dynamic>)
          : BrandModel.empty(),
      images: convertToStringList(json['Images']),
      productAttributes: json['ProductAttributes'] != null &&
              json['ProductAttributes'] is List
          ? (json['ProductAttributes'] as List)
              .map((e) {
                try {
                  return ProductAttributeModel.fromJson(e as Map<String, dynamic>);
                } catch (e) {
                  print('Lỗi xử lý ProductAttribute trong JSON: $e');
                  return null;
                }
              })
              .where((item) => item != null)
              .cast<ProductAttributeModel>()
              .toList()
          : [],
      productVariants: json['ProductVariants'] != null &&
              json['ProductVariants'] is List
          ? (json['ProductVariants'] as List)
              .map((e) {
                try {
                  return ProductVariationModel.fromJson(e as Map<String, dynamic>);
                } catch (e) {
                  print('Lỗi xử lý ProductVariant trong JSON: $e');
                  return null;
                }
              })
              .where((item) => item != null)
              .cast<ProductVariationModel>()
              .toList()
          : [],
    );
  }
}