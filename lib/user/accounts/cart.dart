import 'package:alridafrieds/controller/user_controller.dart';
import 'package:alridafrieds/user/accounts/Payment.dart';
import 'package:alridafrieds/user/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountCart extends StatelessWidget {
  const AccountCart({super.key});

  @override
  Widget build(BuildContext context) {
    final Hieght = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    final cartController = Provider.of<UserController>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff911f2a),
          leading: IconButton(
            icon: ImageIcon(
              const AssetImage('assets/icons/left.png'),
              size: Width * 0.08,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Your Cart',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Consumer<UserController>(builder: (context, itemController, _) {
          return FutureBuilder(
              future: itemController.fetchCart(),
              builder: (context, snapshot) {
                return Container(
                  height: Hieght,
                  width: Width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          // height: Hieght*0.61,
                          margin: const EdgeInsets.all(10),
                          // color: Colors.blueAccent.shade100,
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: Width * 0.01,
                                ),
                                const Text(
                                  'Order list',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AlRidaMenu()),
                                      );
                                    },
                                    child: const Text(
                                      '+add more',
                                      style:
                                          TextStyle(color: Color(0xff3C8A3C)),
                                    ))
                              ],
                            ),
                            const Divider(
                              height: 2,
                              thickness: 2,
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                // color: Colors.pinkAccent.shade100,
                                child: itemController.cartList.isEmpty
                                    ? const Center(
                                        child: Text('No items added'),
                                      )
                                    : ListView.builder(
                                        itemCount:
                                            itemController.cartList.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all()),
                                            // height: Hieght*0.7,
                                            // width: Width-20,
                                            // color: Colors.pinkAccent.shade100,
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        itemController
                                                            .cartList[index]
                                                            .productname,
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      const Spacer(),
                                                      IconButton(
                                                        onPressed: () {
                                                          itemController
                                                              .deleteProduct(
                                                                  itemController
                                                                      .cartList[
                                                                          index]
                                                                      .id);
                                                        },
                                                        icon: const ImageIcon(
                                                          AssetImage(
                                                            'assets/icons/delete.png',
                                                          ),
                                                          size: 18,
                                                          color:
                                                              Color(0xff911f2a),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        itemController
                                                            .cartList[index]
                                                            .productDescription,
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        'Price',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            'assets/icons/rupee-indian.png',
                                                            width: 15,
                                                          ),
                                                          Text(
                                                              "${itemController.cartList[index].productPrice}",
                                                              // (price * quantity).toString(),
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          18)),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                          child: Expanded(
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              // SizedBox(width: 50,),
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                height: 20,
                                                                width: 60,
                                                                child: Row(
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        color: const Color(
                                                                            0xff911f2a),
                                                                      ),
                                                                      width: 20,
                                                                      height:
                                                                          20,
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            IconButton(
                                                                          onPressed:
                                                                              () {
                                                                            itemController.decrementQuantity(itemController.cartList[index].id,
                                                                                itemController.cartList[index].count);
                                                                          },
                                                                          icon:
                                                                              const ImageIcon(
                                                                            AssetImage(
                                                                              'assets/icons/minus-sign.png',
                                                                            ),
                                                                            size:
                                                                                20,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 20,
                                                                      height:
                                                                          20,
                                                                      child: Center(
                                                                          child: Text(
                                                                              "${itemController.cartList[index].count}",
                                                                              style: const TextStyle(fontSize: 15))),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        color: const Color(
                                                                            0xff3C8A3C),
                                                                      ),
                                                                      width: 20,
                                                                      height:
                                                                          20,
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            IconButton(
                                                                          onPressed:
                                                                              () {
                                                                            itemController.incrementQuantity(itemController.cartList[index].id,
                                                                                itemController.cartList[index].count);
                                                                          },
                                                                          icon:
                                                                              const ImageIcon(
                                                                            AssetImage(
                                                                              'assets/icons/plus.png',
                                                                            ),
                                                                            size:
                                                                                20,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              )
                                                            ]),
                                                      )),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  // Divider(
                                                  //   height: 2,
                                                  //   thickness: 1.5,
                                                  // )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Container(
                          height: Hieght * 0.25,
                          color: const Color(0xffededed),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      Text(cartController.subTotal.toString(),
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
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/rupee-indian.png',
                                        width: 15,
                                      ),
                                      Text(
                                          cartController.subTotal == 0
                                              ? "0"
                                              : "${cartController.subTotal + cartController.dlcharge}",
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
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                height: Hieght * 0.07,
                                width: Width - 20,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (itemController.subTotal == 0) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content:
                                                    Text('Choose Something')));
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Payment(
                                                    subtotal:
                                                        cartController.subTotal,
                                                    total: cartController
                                                            .subTotal +
                                                        cartController.dlcharge,
                                                  )),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            itemController.subTotal == 0
                                                ? Colors.grey
                                                : const Color(0xff3C8A3C)),
                                    child: const Text(
                                      'Proceed to checkout',
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
                    ],
                  ),
                );
              });
        }));
  }
}
