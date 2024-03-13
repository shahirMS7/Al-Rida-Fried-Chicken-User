import 'package:alridafrieds/deliveryboy_app/Dashboard.dart';
import 'package:alridafrieds/deliveryboy_app/Home.dart';
import 'package:alridafrieds/models/delivery_boy_model.dart';
import 'package:alridafrieds/models/order_model.dart';
import 'package:alridafrieds/models/selected_order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class DeliveryBoyController extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final TextEditingController loginemailController = TextEditingController();
  final TextEditingController loginpasswordController = TextEditingController();

  Future deliveryBoyLogin(
    String userName,
    String userPassword,
    context,
  ) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: userName, password: userPassword);

      final user = firebaseAuth.currentUser;

      if (user != null) {
        DocumentSnapshot userDoc = await firebaseFirestore
            .collection('deliveryBoys')
            .doc(user.uid)
            .get();
        if (userDoc.exists) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const Dashboard(),
              ),
              (route) => false);
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

  DeliveryBoyModel? _deliveryBoyModel;
  DeliveryBoyModel get deliveryBoyModel => _deliveryBoyModel!;

  String? _dbid;
  String get dbid => _dbid!;

  Future fetchDeliveryBoyData(context) async {
    try {
      await firebaseFirestore
          .collection('deliveryBoys')
          .doc(firebaseAuth.currentUser!.uid)
          .get()
          .then((DocumentSnapshot snapshot) {
        _deliveryBoyModel = DeliveryBoyModel(
            delvryBoyID: snapshot['delvryBoyID'],
            delvryBoyName: snapshot['delvryBoyName'],
            delvryBoyEmail: snapshot['delvryBoyEmail'],
            delvryBoyLicenseNumber: snapshot['delvryBoyLicenseNumber'],
            delvryBoyMobileNumber: snapshot['delvryBoyMobileNumber'],
            delvryBoyVehicleNumber: snapshot['delvryBoyVehicleNumber']);
        _dbid = deliveryBoyModel.delvryBoyID;

        nameController.text = _deliveryBoyModel!.delvryBoyName;
        emailController.text = _deliveryBoyModel!.delvryBoyEmail;
        numberController.text =
            _deliveryBoyModel!.delvryBoyMobileNumber.toString();
      });
    } catch (e) {
      print(e);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('Delivery Boy Data Fetching Failed : $e'),
      //   ),
      // );
    }
  }

  List<OrderModel> ordersList = [];
  OrderModel? orders;

  Future fetchOrders(String docid, String status) async {
    try {
      ordersList.clear();
      final orderRef = firebaseFirestore
          .collection('orders')
          .where("status", isEqualTo: status)
          .where('deliveryboy', isEqualTo: docid);
      final orderSnapshot = await orderRef.get();

      for (var doc in orderSnapshot.docs) {
        String orderid = doc['orderid'];
        String userid = doc['userid'];
        int orderPrice = doc['orderPrice'];
        String userName = doc['userName'];
        String userAddress = doc['userAddress'];
        String status = doc['status'];
        int userNumber = doc['userNumber'];
        List orderedItems = doc['orderedItems'];

        orders = OrderModel(
            orderid: orderid,
            userid: userid,
            orderPrice: orderPrice,
            userName: userName,
            userAddress: userAddress,
            userNumber: userNumber,
            orderedItems: orderedItems,
            status: status);

        print(orders);

        ordersList.add(orders!);
      }
    } catch (e) {
      print(e);
    }
  }

  SelectedOrder? _selectedOrder;
  SelectedOrder get selectedOrder => _selectedOrder!;

  Future dlvrySelectedOrder(OrderModel selected) async {
    try {
      // _selectedOrder!.order = selected;
      print("///////////////// ${selected.toMap()}");
      await firebaseFirestore
          .collection('deliveryBoys')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('selectedorder')
          .doc('order')
          .set(selected.toMap());
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  Future updateProfile(
    String userName,
    String userEmail,
    int userNumber,
  ) async {
    try {
      firebaseFirestore
          .collection('deliveryBoys')
          .doc(firebaseAuth.currentUser!.uid)
          .update({
        'delvryBoyName': userName,
        'delvryBoyEmail': userEmail,
        'delvryBoyMobileNumber': userNumber,
      });
      deliveryBoyModel.delvryBoyName = userName;
      deliveryBoyModel.delvryBoyEmail = userEmail;
      deliveryBoyModel.delvryBoyMobileNumber = userNumber;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future orderUpdate(String orderid, String status) async {
    try {
      await firebaseFirestore
          .collection('orders')
          .doc(orderid)
          .update({'status': status});
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
