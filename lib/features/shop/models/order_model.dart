import 'package:thuctapcoso/features/shop/models/cart_item_model.dart';
import 'package:thuctapcoso/utlis/constants/enums.dart';

class OrderModel {
  final String id;
  final List<CartItemModel> items;
  final double totalAmount;
  final OrderStatus status;
  final DateTime createdAt;

  OrderModel({
    required this.id,
    required this.items,
    required this.totalAmount,
    required this.status,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Items': items.map((item) => item.toJson()).toList(),
      'TotalAmount': totalAmount,
      'Status': status.toString(),
      'CreatedAt': createdAt.toIso8601String(),
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['Id'] as String,
      items: (json['Items'] as List)
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      totalAmount: (json['TotalAmount'] as num).toDouble(),
      status: OrderStatus.values.firstWhere(
        (e) => e.toString() == json['Status'],
        orElse: () => OrderStatus.processing,
      ),
      createdAt: DateTime.parse(json['CreatedAt'] as String),
    );
  }
}

