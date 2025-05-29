class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributes;

  ProductVariationModel({
    required this.id,
    this.sku = "",
    this.image = "",
    this.description = "",
    this.price = 0,
    this.salePrice = 0,
    this.stock = 0,
    required this.attributes,
  });


  static ProductVariationModel empty() => ProductVariationModel(id: "", attributes: {});

  toJson() {
    return {
      'Id': id,
      'SKU': sku,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'Stock': stock,
      'AttributesValues': attributes,
    };
  }

  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      id: data['Id'] ?? "",
      sku: data['SKU'] ?? "",
      image: data['Image'] ?? "",
      description: data['Description'] ?? "",
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      stock: data['Stock'] ?? 0,
      attributes: Map<String, String>.from(data['AttributesValues'] ?? {}),
    );
  }
}
