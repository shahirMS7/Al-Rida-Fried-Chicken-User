import 'package:alridafrieds/models/order_model.dart';

class SelectedOrder {
  OrderModel order;

  SelectedOrder({required this.order});

  factory SelectedOrder.fromMap(Map<String, dynamic> map) {
    return SelectedOrder(order: OrderModel.fromMap(map['order']));
  }

  Map<String, dynamic> toMap() {
    return {
      'order': order.toMap(),
    };
  }
}
