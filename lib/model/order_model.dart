import 'package:flutter_coffee_application/model/cart_model.dart';

class ModelOrder {
    String orderId;
    String userId;
    DateTime orderDate;
    String totalAmount;
    List<ModelCart> items;

    ModelOrder({
        required this.orderId,
        required this.userId,
        required this.orderDate,
        required this.totalAmount,
        required this.items,
    });

    factory ModelOrder.fromJson(Map<String, dynamic> json) => ModelOrder(
        orderId: json["order_id"],
        userId: json["user_id"],
        orderDate: DateTime.parse(json["order_date"]),
        totalAmount: json["total_amount"],
        items: List<ModelCart>.from(json["items"].map((x) => ModelCart.fromJson(x))),
    );
}