class CartItemModel {
  final String productId;
  final String title;
  final double price;
  int quantity;
  final String? image;
  final Map<String, String>? selectedVariation;
  int stock;
  final String? brandName;

  // Constructor
  CartItemModel({
    required this.productId,
    required this.title,
    required this.price,
    required this.quantity,
    this.image,
    this.selectedVariation,
    required this.stock,
    this.brandName,
  });

  // Empty Cart
  factory CartItemModel.empty() {
    return CartItemModel(
      productId: '',
      title: '',
      price: 0.0,
      quantity: 0,
      stock: 0,
    );
  }

  // Convert a CartItem to a JSON Map
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'quantity': quantity,
      'image': image,
      'selectedVariation': selectedVariation,
      'stock': stock,
      'brandName': brandName,
    };
  }

  // CREATE a CartItem from a JSON Map
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
      image: json['image'] as String?,
      selectedVariation: json['selectedVariation'] != null
          ? Map<String, String>.from(json['selectedVariation'] as Map)
          : null,
      stock: json['stock'] as int,
      brandName: json['brandName'] as String?,
    );
  }
}
