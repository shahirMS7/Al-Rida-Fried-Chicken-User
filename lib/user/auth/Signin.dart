import 'package:alridafrieds/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:alridafrieds/user/auth/SignUp.dart';
import 'package:alridafrieds/user/auth/forgotpass.dart';
import 'package:alridafrieds/user/main/bottom%20navigation.dart';
import 'package:provider/provider.dart';

class Signin extends StatelessWidget {
  Signin({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    final loginController = Provider.of<UserController>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: const Color(0xfff2b45e),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: Height * 0.1),
                Text(
                  'Sign In',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Height * 0.03),
                ),
                SizedBox(height: Height * 0.14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: Width * 0.025),
                    Text(
                      'Email',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Height * 0.025),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: loginController.loginemailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: Width * 0.007),
                        borderRadius: BorderRadius.circular(Height * 0.015),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Height * 0.015),
                        borderSide: BorderSide(
                            width: Width * 0.007, color: Colors.black),
                      ),
                      hintText: 'Enter your Email',
                    ),
                  ),
                ),
                SizedBox(height: Height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: Width * 0.025),
                    Text(
                      'Password',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Height * 0.025),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: loginController.loginpasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: Width * 0.007),
                        borderRadius: BorderRadius.circular(Height * 0.015),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Height * 0.015),
                        borderSide: BorderSide(
                            width: Width * 0.007, color: Colors.black),
                      ),
                      hintText: 'Enter your password',
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword()),
                        );
                      },
                      child: const Text(
                        'forgot password?',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Height * 0.01),
                SizedBox(
                  height: Height * 0.07,
                  width: Width * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        loginController.userLogin(
                            loginController.loginemailController.text,
                            loginController.loginpasswordController.text,
                            context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Height * 0.025,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: Height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Dont have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
