import 'package:alridafrieds/controller/delivery_boy_controller.dart';
import 'package:alridafrieds/deliveryboy_app/DLProfile.dart';
import 'package:alridafrieds/deliveryboy_app/Dl%20notification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Delivered extends StatefulWidget {
  const Delivered({super.key});

  @override
  State<Delivered> createState() => _DeliveredState();
}

class _DeliveredState extends State<Delivered> {
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff911f2a),
        automaticallyImplyLeading: false,
        title: const Text(
          'Delivered',
          style: TextStyle(
            fontFamily: 'poppins',
            fontSize: 20,
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
      body: Container(
          height: Height,
          width: Width,
          child: Consumer<DeliveryBoyController>(
              builder: (context, deliveredCOntroller, _) {
            return FutureBuilder(
                future: deliveredCOntroller.fetchOrders(
                    deliveredCOntroller.deliveryBoyModel.delvryBoyID,
                    'delivered'),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: deliveredCOntroller.ordersList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: Height * 0.07,
                        // width: 330,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(),
                        ),
                        margin: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: Width * 0.08,
                            ),
                            const Text(
                              '1',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            // Spacer(),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Text(
                                'Order No: ${deliveredCOntroller.ordersList[index].orderid}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                            const Spacer(),
                            // SizedBox(width: 30,),
                            Container(
                              height: 30,
                              child: Image.asset('assets/icons/check-mark.png'),
                            ),
                            const SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      );
                    },
                  );
                });
          })),
    );
  }
}
