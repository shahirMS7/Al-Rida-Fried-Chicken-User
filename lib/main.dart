import 'package:alridafrieds/controller/delivery_boy_controller.dart';
import 'package:alridafrieds/controller/user_controller.dart';
import 'package:alridafrieds/deliveryboy_app/Dashboard.dart';
import 'package:alridafrieds/user/auth/LoginSignup.dart';
import 'package:alridafrieds/user/main/bottom%20navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = const Color(0xFFA91313); // Desired primary color
    Color defaultWidgetBackgroundColor =
        const Color(0xff66161d); // Desired default color

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserController>(
          create: (context) => UserController(),
        ),
        ChangeNotifierProvider<DeliveryBoyController>(
          create: (context) => DeliveryBoyController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'poppins',
          primaryColor: Colors.black,
          primarySwatch: MaterialColor(primaryColor.value, {
            50: primaryColor.withOpacity(0.1),
            100: primaryColor.withOpacity(0.2),
            200: primaryColor.withOpacity(0.3),
            300: primaryColor.withOpacity(0.4),
            400: primaryColor.withOpacity(0.5),
            500: primaryColor,
            600: primaryColor.withOpacity(0.6),
            700: primaryColor.withOpacity(0.7),
            800: primaryColor.withOpacity(0.8),
            900: primaryColor.withOpacity(0.9),
          }),
          // backgroundColor: defaultWidgetBackgroundColor, // Set default background color
        ),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Show a loading indicator while checking authentication state
            }
            if (snapshot.hasData) {
              User? user = snapshot.data;
              return FutureBuilder<bool>(
                future: checkUserExist(user!.uid),
                builder: (context, userExistSnapshot) {
                  // if (userExistSnapshot.connectionState ==
                  //     ConnectionState.waiting) {
                  //   return CircularProgressIndicator(); // Show a loading indicator while checking user existence
                  // }
                  if (userExistSnapshot.hasData && userExistSnapshot.data!) {
                    return const HomeScreen(); // User exists in either users or deliveryboy collection
                  } else {
                    return const Dashboard(); // User doesn't exist in either collection
                  }
                },
              );
            } else {
              return const SignUporIn(); // User not authenticated
            }
          },
        ),

        //  StreamBuilder(
        //     stream: FirebaseAuth.instance.authStateChanges(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         final user =
        //             FirebaseFirestore.instance.collection('users').get();
        //         return const HomeScreen();
        //       } else {
        //         return const SignUporIn();
        //       }
        //     }),
        // home: OrderPlaced(),
      ),
    );
  }

  Future<bool> checkUserExist(String uid) async {
    var deliveryBoyDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return deliveryBoyDoc.exists;
  }
}
