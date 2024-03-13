import 'package:alridafrieds/user/accounts/Contact.dart';
import 'package:alridafrieds/user/accounts/Order.dart';
import 'package:alridafrieds/user/accounts/Profile.dart';
import 'package:alridafrieds/user/accounts/Search.dart';
import 'package:alridafrieds/user/accounts/cart.dart';
import 'package:alridafrieds/user/auth/LoginSignup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Accounts extends StatelessWidget {
  const Accounts({super.key});

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff911f2a),
          automaticallyImplyLeading: false,
          title: const Text(
            'Account',
            style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          actions: [
            // Padding(
            //   padding: const EdgeInsets.only(right: 10),
            //   child: Container(
            //       height: 40,
            //       width: 40,
            //       decoration: BoxDecoration(
            //           color: const Color(0xff66161d),
            //           borderRadius: BorderRadius.circular(30)),
            //       child: Center(
            //         child: IconButton(
            //           icon: const ImageIcon(
            //             AssetImage('assets/icons/search.png'),
            //             size: 30,
            //             color: Colors.white,
            //           ),
            //           onPressed: () {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => const SearchPage()),
            //             );
            //           },
            //         ),
            //       )),
            // ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: const Color(0xff66161d),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: IconButton(
                      icon: const ImageIcon(
                        AssetImage('assets/icons/cart.png'),
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AccountCart()),
                        );
                      },
                    ),
                  )),
            ),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: ListView(children: [
            Column(
              children: [
                SizedBox(
                  height: Height * 0.03,
                ),
                const Row(
                  children: [
                    Text(
                      'Account and Settings',
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ), //// Text Row
                SizedBox(
                  height: Height * 0.03,
                ),

                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(30)),
                  child: IconButton(
                    iconSize: 32,
                    icon: const Icon(Icons.image),
                    onPressed: () {
                      // ...
                    },
                  ),
                  // ) ,
                ),
                const SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: Height * 0.075,
                  width: Width - 20,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        // foregroundColor: Colors.black, //
                        // background color of button
                        // side: BorderSide(), //border width and color
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                            //to set border radius to button
                            ), //content padding inside button
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileUser()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 1),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/user.png',
                                  width: 25,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text(
                                  'Profile',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'poppins',
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/icons/right-arrow.png',
                            width: 15,
                          ),
                        ],
                      )),
                ), //Order Button
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: Height * 0.075,
                  width: Width - 20,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        // foregroundColor: Colors.black, //
                        // background color of button
                        // side: BorderSide(), //border width and color
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                            //to set border radius to button
                            ), //content padding inside button
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AccountOrder()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 1),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/order-food.png',
                                  width: 25,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text(
                                  'Order',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'poppins',
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/icons/right-arrow.png',
                            width: 15,
                          ),
                        ],
                      )),
                ), //Order Button
                const SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: Height * 0.075,
                  width: Width - 20,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black, //
                        // background color of button
                        // side: BorderSide(), //border width and color
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                            //to set border radius to button
                            ), //content padding inside button
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AccountCart()),
                        );
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(builder: (ctx) => Cart()),
                        // );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 1),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/cart.png',
                                  width: 30,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text(
                                  'Show Your Cart',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'poppins',
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/icons/right-arrow.png',
                            width: 15,
                          ),
                        ],
                      )),
                ), //Show you cart

                const SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: Height * 0.075,
                  width: Width - 20,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black, //
                        // background color of button
                        // side: BorderSide(), //border width and color
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                            //to set border radius to button
                            ), //content padding inside button
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ContactUs()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 1),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/support.png',
                                  width: 25,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text(
                                  'Contact Us',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'poppins',
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/icons/right-arrow.png',
                            width: 15,
                          ),
                        ],
                      )),
                ), //Saved Address

                const SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: Height * 0.075,
                  width: Width - 20,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black, //
                        // background color of button
                        // side: BorderSide(), //border width and color
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                            //to set border radius to button
                            ), //content padding inside button
                      ),
                      onPressed: () {
                        showSignOutConfirmationDialog(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 1),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/exit.png',
                                  color: const Color(0xff911f2a),
                                  width: 25,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text(
                                  'Sign Out',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'poppins',
                                    color: Color(0xff911f2a),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/icons/right-arrow.png',
                            width: 15,
                          ),
                        ],
                      )),
                ), //Sign Out
              ],
            ),
          ]),
        ));
  }
}

void showSignOutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Sign Out"),
        content: const Text("Are you sure you want to sign out?"),
        actions: [
          TextButton(
            onPressed: () {
              // Perform sign-out actions here
              // For example, you can navigate to the login screen
              // or clear user session data.
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text(
              "No",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              FirebaseAuth.instance
                  .signOut()
                  .then((value) => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const SignUporIn(),
                      ),
                      (route) => false)); // Close the dialog
            },
            child: const Text(
              "Yes",
              style: TextStyle(
                color: Color(0xff911f2a),
              ),
            ),
          ),
        ],
      );
    },
  );
}
