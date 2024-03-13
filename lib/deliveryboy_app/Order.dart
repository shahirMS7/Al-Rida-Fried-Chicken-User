import 'package:alridafrieds/controller/delivery_boy_controller.dart';
import 'package:alridafrieds/deliveryboy_app/DLProfile.dart';
import 'package:alridafrieds/deliveryboy_app/Dl%20notification.dart';
import 'package:alridafrieds/deliveryboy_app/Progress.dart';
import 'package:alridafrieds/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff911f2a),
        automaticallyImplyLeading: false,
        title: Text(
          'Orders',
          style: TextStyle(
            fontSize: Height * 0.025,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 10),
          //   child: Container(
          //     height: 40,
          //     width: 40,
          //     decoration: BoxDecoration(
          //       color: const Color(0xff66161d),
          //       borderRadius: BorderRadius.circular(30),
          //     ),
          //     child: Center(
          //       child: IconButton(
          //         icon: const ImageIcon(
          //           AssetImage('assets/delivryboy/icon/bell.png'),
          //           size: 30,
          //           color: Colors.white,
          //         ),
          //         onPressed: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => const DlNotification()),
          //           );
          //         },
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: const Color(0xff66161d),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: IconButton(
                  icon: const ImageIcon(
                    AssetImage('assets/delivryboy/icon/user icon.png'),
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DlProfile()),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: Height,
        width: Width,
        child: Consumer<DeliveryBoyController>(
            builder: (context, orderController, _) {
          return FutureBuilder(
              future: orderController.fetchDeliveryBoyData(context).then(
                    (value) => orderController.fetchOrders(
                        orderController.deliveryBoyModel.delvryBoyID,
                        'assigned'),
                  ),
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
                              return InkWell(
                                onTap: () async {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Progress(
                                        orderid: orderController
                                            .ordersList[index].orderid,
                                        index: index + 1,
                                        address: orderController
                                            .ordersList[index].userAddress,
                                        name: orderController
                                            .ordersList[index].userName,
                                        number: orderController
                                            .ordersList[index].userNumber,
                                        items: orderController
                                            .ordersList[index].orderedItems),
                                  ));
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  height: Height * 0.15,
                                  // width: Width-20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all()),

                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${index + 1}',
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            // Text(
                                            //   orderController.deliveryBoyModel
                                            //       .delvryBoyName,
                                            //   style: const TextStyle(
                                            //     fontSize: 12,
                                            //     color: Color(0xff66161d),
                                            //   ),
                                            // )
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Divider(
                                          height: 1,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              orderController.ordersList[index]
                                                  .userAddress,
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
              });
        }),
      ),
    );
  }
}
// Container(
// margin: EdgeInsets.all(10),
// height: Height*0.15,
// // width: Width-20,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// border: Border.all()
// ),
//
// child: Column(
// children: [
// SizedBox(height: 5,),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 5),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
//
// Text('Order No:#002',style: TextStyle(
// fontSize: 15,
// fontWeight: FontWeight.bold
// ),),
// Text('2 min ago',style: TextStyle(
// fontSize: 12,
// color: Color(0xff66161d),
// ),)
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(10),
// child: Divider(
// height: 1,
//
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(left: 10),
// child: Row(
// children: [
// Text('Address',style: TextStyle(
// fontSize: 15
// ),),
// ],
// ),
// ),
// ],
// ),
//
// ),
