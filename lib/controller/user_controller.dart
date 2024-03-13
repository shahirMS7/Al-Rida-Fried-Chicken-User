import 'package:alridafrieds/models/cart_model.dart';
import 'package:alridafrieds/models/order_model.dart';
import 'package:alridafrieds/models/user_model.dart';
import 'package:alridafrieds/user/accounts/order%20placed.dart';
import 'package:alridafrieds/user/auth/LoginSignup.dart';
import 'package:alridafrieds/user/main/bottom%20navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../models/products_model.dart';

class UserController extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController createpassController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();
  final TextEditingController userNumberController = TextEditingController();

  UserModel? _userModel;
  UserModel get userModel => _userModel!;

  Future userSignUp(
    String userName,
    String userEmail,
    String userPassword,
    int userNumber,
    context,
  ) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: userEmail, password: userPassword);
      final user = firebaseAuth.currentUser;
      final userid = user!.uid;
      await user.sendEmailVerification();
      _userModel = UserModel(
        userID: userid,
        userName: userName,
        userEmail: userEmail,
        userNumber: userNumber,
      );
      await firebaseFirestore
          .collection('users')
          .doc(userid)
          .set(_userModel!.toMap());
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Verification Email send to $userEmail. Please verify to login'),
        ),
      );
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const SignUporIn(),
          ),
          (route) => false);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Signup failed : $e'),
        ),
      );
      print(e);
    }
  }

  final TextEditingController loginemailController = TextEditingController();
  final TextEditingController loginpasswordController = TextEditingController();

  Future userLogin(
    String userName,
    String userPassword,
    context,
  ) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: userName, password: userPassword);

      final user = firebaseAuth.currentUser;

      if (user != null) {
        DocumentSnapshot userDoc =
            await firebaseFirestore.collection('users').doc(user.uid).get();
        if (userDoc.exists) {
          if (user.emailVerified) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
                (route) => false);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please verify to login'),
              ),
            );
          }
        }
      }

      notifyListeners();
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed : $e'),
        ),
      );
    }
  }

  String? _uid;
  String get uid => _uid!;
  Future fetchUserData(context) async {
    try {
      await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .get()
          .then((DocumentSnapshot snapshot) {
        _userModel = UserModel(
          userID: snapshot['userID'],
          userName: snapshot['userName'],
          userEmail: snapshot['userEmail'],
          userNumber: snapshot['userNumber'],
          userAddress: snapshot['userAddress'] ?? '',
        );
        _uid = userModel.userID;

        editnameController.text = userModel.userName;
        editemailController.text = userModel.userEmail;
        editmobilenumberController.text = userModel.userNumber.toString();
        editaddressController.text = userModel.userAddress!;
      });
    } catch (e) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('User Data Fetching Failed : $e'),
      //   ),
      // );
    }
  }

  List<ProductsModel> specialproductsList = [];
  List<ProductsModel> menuList = [];
  List<ProductsModel> dipList = [];
  List<ProductsModel> breadsList = [];
  List<ProductsModel> drinksList = [];
  ProductsModel? products;

  Future fetchProducts(String collection, List<ProductsModel> itemList) async {
    try {
      itemList.clear();
      CollectionReference productsRef =
          firebaseFirestore.collection(collection);
      QuerySnapshot productsSnapshot = await productsRef.get();

      for (var doc in productsSnapshot.docs) {
        String productID = doc['productID'];
        String productTitle = doc['productTitle'];
        String productImage = doc['productImage'];
        String productDescription = doc['productDescription'];
        int productPrice = doc['productPrice'];
        int productOffer = doc['productOffer'];
        int productAvailability = doc['productAvailability'];

        products = ProductsModel(
            productID: productID,
            productTitle: productTitle,
            productDescription: productDescription,
            productImage: productImage,
            productPrice: productPrice,
            productOffer: productOffer,
            productAvailability: productAvailability);

        itemList.add(products!);
      }
    } catch (e) {
      print('Fetching products failed :$e');
    }
  }

  CartModel? _cartModel;
  CartModel get cartModel => _cartModel!;

  Future addtoCart(String productid, String productname,
      String productDescription, int productPrice, int count, context) async {
    try {
      final docRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('cart')
          .doc();
      _cartModel = CartModel(
        id: docRef.id,
        productid: productid,
        productname: productname,
        productDescription: productDescription,
        productPrice: productPrice,
        count: count,
      );

      await docRef.set(_cartModel!.toMap());
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Item Added to cart'),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  List<CartModel> cartList = [];
  CartModel? cart;

  int subTotal = 0;
  int dlcharge = 40;

  Future fetchCart() async {
    try {
      subTotal = 0;
      cartList.clear();

      CollectionReference cartRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('cart');
      QuerySnapshot cartSnapshot = await cartRef.get();

      for (var doc in cartSnapshot.docs) {
        String id = doc['id'];
        String productid = doc['productid'];
        String productname = doc['productname'];
        String productDescription = doc['productDescription'];
        int productPrice = doc['productPrice'];
        int count = doc['count'];

        cart = CartModel(
            id: id,
            productid: productid,
            productname: productname,
            productDescription: productDescription,
            productPrice: productPrice,
            count: count);

        subTotal = (cart!.productPrice * cart!.count) + subTotal;

        cartList.add(cart!);
      }
    } catch (e) {
      print('Fetching cart failed : $e');
    }
  }

  int quantity = 1;
  int price = 99;

  void incrementQuantity(String itemid, int count) async {
    if (count < 5) quantity++;
    print('ncrement');
    count++;
    await firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .collection('cart')
        .doc(itemid)
        .update({'count': count});
    print(count);
    print(itemid);
    print('incrmnt cmpltd');
    notifyListeners();
  }

  void decrementQuantity(String itemid, int count) async {
    if (count > 1) {
      count--;
      await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('cart')
          .doc(itemid)
          .update({'count': count});
      notifyListeners();
    }
  }

  Future deleteProduct(String itemid) async {
    try {
      await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('cart')
          .doc(itemid)
          .delete();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  final TextEditingController editnameController = TextEditingController();
  final TextEditingController editemailController = TextEditingController();
  final TextEditingController editmobilenumberController =
      TextEditingController();
  final TextEditingController editaddressController = TextEditingController();

  Future updateProfile(
    String userName,
    String userEmail,
    int userNumber,
    String userAddress,
  ) async {
    try {
      firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .update({
        'userName': userName,
        'userEmail': userEmail,
        'userNumber': userNumber,
        'userAddress': userAddress,
      });
      userModel.userName = userName;
      userModel.userEmail = userEmail;
      userModel.userNumber = userNumber;
      userModel.userAddress = userAddress;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  OrderModel? _orderModel;
  OrderModel get orderModel => _orderModel!;

  Future placeOrder(
    int amount,
    String userName,
    int userNumber,
    String userAddress,
    context,
  ) async {
    try {
      final userOrderDoc = firebaseFirestore.collection('orders').doc();
      _orderModel = OrderModel(
          orderid: userOrderDoc.id,
          userid: firebaseAuth.currentUser!.uid,
          orderPrice: amount,
          userName: userName,
          userAddress: userAddress,
          userNumber: userNumber,
          orderedItems: cartList,
          status: 'pending');
      await userOrderDoc.set(_orderModel!.toMap());
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const OrderPlaced(),
      ));
      notifyListeners();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('OOps... Something went wrong : $e')));
    }
  }

  List<OrderModel> ordersList = [];
  OrderModel? orders;

  Future fetchOrders(String userid) async {
    try {
      ordersList.clear();
      final orderRef = firebaseFirestore
          .collection('orders')
          .where('userid', isEqualTo: userid);
      final orderSnapshot = await orderRef.get();

      for (var doc in orderSnapshot.docs) {
        String orderid = doc['orderid'];
        String userid = doc['userid'];
        int orderPrice = doc['orderPrice'];
        String userName = doc['userName'];
        String userAddress = doc['userAddress'];
        int userNumber = doc['userNumber'];
        String status = doc['status'];

        orders = OrderModel(
            orderid: orderid,
            userid: userid,
            orderPrice: orderPrice,
            userName: userName,
            userAddress: userAddress,
            userNumber: userNumber,
            orderedItems: cartList,
            status: status);

        ordersList.add(orders!);
      }
    } catch (e) {
      print(e);
    }
  }

  //   Future clearCart(String itemid) async {
  //   try {
  //     await firebaseFirestore
  //         .collection('users')
  //         .doc(firebaseAuth.currentUser!.uid)
  //         .collection('cart')
  //         .doc(itemid)
  //         .delete();
  //     notifyListeners();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<void> clearCart() async {
    // Reference to the Firestore collection
    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .collection('cart');

    // Get all documents in the collection
    QuerySnapshot querySnapshot = await collectionReference.get();

    // Create a batch
    WriteBatch batch = FirebaseFirestore.instance.batch();

    // Iterate through each document and add delete operation to the batch
    querySnapshot.docs.forEach((document) {
      batch.delete(document.reference);
    });

    // Commit the batch
    await batch.commit();
  }
}
