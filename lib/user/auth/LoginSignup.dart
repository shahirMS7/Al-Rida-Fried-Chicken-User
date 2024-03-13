import 'package:alridafrieds/deliveryboy_app/signin.dart';
import 'package:alridafrieds/user/auth/SignUp.dart';
import 'package:alridafrieds/user/auth/Signin.dart';
import 'package:flutter/material.dart';

class SignUporIn extends StatelessWidget {
  const SignUporIn({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/friedBucket.jpg",
                ),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: InkWell(
                      onTap: () {
                        _showOptionsDialog(context);
                      },
                      child: Container(
                        width: width * 0.12,
                        // height: height*0.1,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffe3a95c)),
                        child: Center(
                          child: Image.asset(
                            "assets/icons/users.png", // Replace with your image asset
                            width: width * 0.06,
                            height: height * 0.06, //changed 30
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  )
                ],
              ),
              SizedBox(
                height: height * 0.7,
              ),
              Container(
                  //Sign in button
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height * 0.03),
                    border: Border.all(width: width * 0.008),
                  ),
                  height: height * 0.06,
                  width: width * 0.65,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signin()),
                        );
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ))),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                //Sign in button
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(height * 0.03),
                ),
                height: height * 0.06,
                width: width * 0.65,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => MyS));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontFamily: 'poppins',
                      color: Colors.white,
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select User type'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Customer '),
                onTap: () {
                  // Handle Customer option click
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Delivery Boy'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DlSignin()),
                  );
                  // Handle Delivery Boy option click
                  // Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
