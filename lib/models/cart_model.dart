class CartModel {
  String id;
  String productid;
  String productname;
  String productDescription;
  int productPrice;
  int count;

  CartModel({
    required this.id,
    required this.productid,
    required this.productname,
    required this.productDescription,
    required this.productPrice,
    required this.count,
  });

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'],
      productid: map['productid'],
      productname: map['productname'],
      productDescription: map['productDescription'],
      productPrice: map['productPrice'],
      count: map['count'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productid': productid,
      'productname': productname,
      'productDescription': productDescription,
      'productPrice': productPrice,
      'count': count,
    };
  }
}
