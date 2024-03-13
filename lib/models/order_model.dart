import 'package:alridafrieds/models/cart_model.dart';

class OrderModel {
  String orderid;
  String userid;
  int orderPrice;
  String userName;
  String userAddress;
  int userNumber;
  List orderedItems;
  String status;
  // DateTime orderTime;

  OrderModel({
    required this.orderid,
    required this.userid,
    required this.orderPrice,
    required this.userName,
    required this.userAddress,
    required this.userNumber,
    required this.orderedItems,
    required this.status,
    // required this.orderTime,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    var list = map['orderedItems'] as List;
    return OrderModel(
      orderid: map['orderid'],
      userid: map['userid'],
      orderPrice: map['orderPrice'],
      userName: map['userName'],
      userAddress: map['userAddress'],
      userNumber: map['userNumber'],
      orderedItems: list.map((e) {
        return CartModel.fromMap(e);
      }).toList(),
      status: map['status'],
      // orderTime: map['orderTime'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderid': orderid,
      'userid': userid,
      'orderPrice': orderPrice,
      'userName': userName,
      'userAddress': userAddress,
      'userNumber': userNumber,
      'orderedItems': orderedItems.map((e) => e.toMap()),
      'status': status,
      // 'orderTime': orderTime,
    };
  }
}
