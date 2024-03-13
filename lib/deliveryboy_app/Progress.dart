import 'package:alridafrieds/controller/delivery_boy_controller.dart';
import 'package:alridafrieds/deliveryboy_app/DLProfile.dart';
import 'package:alridafrieds/deliveryboy_app/Dl%20notification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Progress extends StatelessWidget {
  final String orderid;
  final int index;
  final String address;
  final String name;
  final int number;
  final List items;
  const Progress({
    required this.orderid,
    required this.index,
    required this.address,
    required this.name,
    required this.number,
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff911f2a),
          // automaticallyImplyLeading: false,
          title: const Text(
            'Progress',
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
        body: Consumer<DeliveryBoyController>(
            builder: (context, progressController, _) {
          return SingleChildScrollView(
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: Colors.greenAccent
              ),
              margin: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order No:#$index',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          '1 min ago',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff911f2a),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child:
                        Divider(height: 2, thickness: 1, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Address:',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              address,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Name :',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              name,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Text(
                              'Mobile Number :',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '9946678196',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    // height: height * 0.15,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Row(
                            children: [
                              Text(
                                'Ordered item:',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Text(
                                    'No',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    'Item',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 200,
                                child: Expanded(
                                  child: ListView.builder(
                                    itemCount: items
                                        .length, // replace items with your list
                                    itemBuilder: (context, index) {
                                      // Use the index to access each item in the list
                                      return Row(
                                        children: [
                                          Text(
                                            '${index + 1}', // Adding 1 to index to start from 1 instead of 0
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            items[index][
                                                'productname'], // Accessing product name from the list
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Container(
                  //   margin: const EdgeInsets.symmetric(horizontal: 10),
                  //   height: height * .15,
                  //   width: width,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     border: Border.all(),
                  //     // color: Colors.greenAccent,
                  //   ),
                  //   child: Column(
                  //     children: [
                  //       const Padding(
                  //         padding: EdgeInsets.only(left: 5),
                  //         child: Row(
                  //           children: [
                  //             Text(
                  //               'Ordered item:',
                  //               style: TextStyle(fontSize: 18),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.only(left: 5),
                  //         child: Column(
                  //           children: [
                  //             const Row(
                  //               children: [
                  //                 Text(
                  //                   'No',
                  //                   style: TextStyle(fontSize: 15),
                  //                 ),
                  //                 SizedBox(
                  //                   width: 30,
                  //                 ),
                  //                 Text(
                  //                   'Item',
                  //                   style: TextStyle(fontSize: 15),
                  //                 ),
                  //               ],
                  //             ),
                  //             // Expanded(
                  //             //   child: ListView.builder(
                  //             //     itemBuilder: (context, index2) {
                  //             //       return Row(
                  //             //         children: [
                  //             //           Text(items[index2]['productname'])
                  //             //         ],
                  //             //       );
                  //             //     },
                  //             //   ),
                  //             // )
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: height * .07,
                    width: width * .9,
                    child: ElevatedButton(
                        onPressed: () {
                          progressController.orderUpdate(
                              orderid, 'outfordelivery');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff911f2a),
                        ),
                        child: const Text(
                          'Out for delivery',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: height * .07,
                    width: width * .9,
                    child: ElevatedButton(
                        onPressed: () {
                          progressController.orderUpdate(orderid, 'delivered');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff3C8A3C),
                        ),
                        child: const Text(
                          'Delivered',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: height * .07,
                    width: width * .9,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff1b7787),
                        ),
                        child: const Text(
                          'Call',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
