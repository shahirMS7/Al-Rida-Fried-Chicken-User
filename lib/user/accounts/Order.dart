import 'package:alridafrieds/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountOrder extends StatelessWidget {
  const AccountOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff911f2a),
          leading: IconButton(
            icon: const ImageIcon(
              AssetImage('assets/icons/left.png'),
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Orders',
            style: TextStyle(color: Colors.white, fontFamily: 'poppins'),
          ),
        ),
        body: Consumer<UserController>(
          builder: (context, orderController, child) {
            return FutureBuilder(
              future:
                  orderController.fetchOrders(orderController.userModel.userID),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : orderController.ordersList.isEmpty
                        ? const Center(
                            child: Text('No Orders'),
                          )
                        : ListView.builder(
                            itemCount: orderController.ordersList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: Width * 0.02,
                                    vertical: Height * 0.02),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade400),
                                height: Height * 0.08,
                                width: Width,
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Order id: ${orderController.ordersList[index].orderid}',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: Image.asset(
                                          'assets/icons/check-mark.png'),
                                    ),
                                    SizedBox(
                                      width: Width * 0.05,
                                    )
                                  ],
                                ),
                              );
                            },
                          );
              },
            );
          },
        ));
  }
}
