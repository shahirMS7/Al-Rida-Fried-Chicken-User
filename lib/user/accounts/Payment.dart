import 'package:alridafrieds/controller/user_controller.dart';
import 'package:alridafrieds/user/accounts/order%20placed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Payment extends StatefulWidget {
  final int subtotal;
  final int total;
  const Payment({
    required this.total,
    required this.subtotal,
    super.key,
  });

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int? selectedRadio = 3; // Make it nullable

  @override
  Widget build(BuildContext context) {
    final Hieght = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    final paymentController =
        Provider.of<UserController>(context, listen: false);
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
          'Payment',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const Row(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 10,
                    ),
                    Text(
                      'Choose payment Option',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: Hieght * 0.07,
                  width: Width - 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset('assets/icons/google-pay.png'),
                      ),
                      SizedBox(
                        width: Width * 0.03,
                      ),
                      const Text(
                        'G Pay (Not available)',
                        style: TextStyle(fontSize: 20),
                      ),
                      const Spacer(),
                      Radio(
                        value: 0,
                        groupValue: selectedRadio,
                        onChanged: (value) {
                          // setState(() {
                          //   selectedRadio = value as int?;
                          // });
                        },
                        activeColor: const Color(0xff911f2a),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Container(
                //   height: Hieght * 0.07,
                //   width: Width - 20,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       border: Border.all()),
                //   child: Row(
                //     children: [
                //       const SizedBox(
                //         width: 10,
                //       ),
                //       SizedBox(
                //         height: 40,
                //         width: 40,
                //         child: Image.asset('assets/icons/paytm.png'),
                //       ),
                //       SizedBox(
                //         width: Width * 0.03,
                //       ),
                //       const Text(
                //         'Paytm  (Not available)',
                //         overflow: TextOverflow.ellipsis,
                //         style: TextStyle(fontSize: 20),
                //       ),
                //       const Spacer(),
                //       Radio(
                //         value: 1,
                //         groupValue: selectedRadio,
                //         onChanged: (value) {
                //           // setState(() {
                //           //   selectedRadio = value as int?;
                //           // });
                //         },
                //         activeColor: const Color(0xff911f2a),
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Container(
                //   height: Hieght * 0.07,
                //   width: Width - 20,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       border: Border.all()),
                //   child: Row(
                //     children: [
                //       const SizedBox(
                //         width: 10,
                //       ),
                //       SizedBox(
                //         height: 40,
                //         width: 40,
                //         child: Image.asset('assets/icons/upi-icon.png'),
                //       ),
                //       SizedBox(
                //         width: Width * 0.03,
                //       ),
                //       const Text(
                //         'UPI (Not available)',
                //         style: TextStyle(fontSize: 20),
                //       ),
                //       const Spacer(),
                //       Radio(
                //         value: 2,
                //         groupValue: selectedRadio,
                //         onChanged: (value) {
                //           // setState(() {
                //           //   selectedRadio = value as int?;
                //           // });
                //         },
                //         activeColor: const Color(0xff911f2a),
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: Hieght * 0.07,
                  width: Width - 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset(
                          'assets/icons/rupee-indian.png',
                          scale: 30,
                        ),
                      ),
                      SizedBox(
                        width: Width * 0.03,
                      ),
                      const Text(
                        'Cash on delivery',
                        style: TextStyle(fontSize: 20),
                      ),
                      const Spacer(),
                      Radio(
                        value: 3,
                        groupValue: selectedRadio,
                        onChanged: (value) {
                          setState(() {
                            selectedRadio = value as int?;
                          });
                        },
                        activeColor: const Color(0xff911f2a),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              width: double.infinity,
              child: SizedBox(
                // height: 250,
                width: double.infinity,
                child: Container(
                    height: Hieght * 0.25,
                    color: const Color(0xffededed),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: Width * 0.02,
                            ),
                            const Text(
                              'subtotal',
                              style: TextStyle(fontSize: 18),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/rupee-indian.png',
                                  width: 15,
                                ),
                                Text('${widget.subtotal}',
                                    // (price * quantity).toString(),
                                    style: const TextStyle(fontSize: 18)),
                                SizedBox(
                                  width: Width * 0.02,
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(
                          height: 2,
                          thickness: 1.5,
                        ),
                        SizedBox(
                          height: Hieght * 0.01,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: Width * 0.02,
                            ),
                            const Text(
                              'Total',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/rupee-indian.png',
                                  width: 15,
                                ),
                                Text('${widget.total}',
                                    // (price * quantity+dlcharge).toString(),
                                    style: const TextStyle(fontSize: 18)),
                                SizedBox(
                                  width: Width * 0.02,
                                ),
                              ],
                            )
                          ],
                        ),
                        const Row(
                          children: [
                            SizedBox(width: 5),
                            Text(
                              '(inclusive delivery charges&GST)',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          height: Hieght * 0.07,
                          width: Width - 20,
                          child: ElevatedButton(
                              onPressed: () {
                                paymentController
                                    .placeOrder(
                                        widget.total,
                                        paymentController.userModel.userName,
                                        paymentController.userModel.userNumber,
                                        paymentController
                                            .userModel.userAddress!,
                                        context)
                                    .then((value) =>
                                        paymentController.clearCart());
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff3C8A3C)),
                              child: const Text(
                                'Confirm Payment',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: Hieght * 0.02,
                        )
                      ],
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
