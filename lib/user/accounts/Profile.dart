import 'package:alridafrieds/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileUser extends StatelessWidget {
  ProfileUser({super.key});
  final profilekey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    final profileController =
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
            'Profile',
            style: TextStyle(color: Colors.white, fontFamily: 'poppins'),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: profilekey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                        color: Colors.grey, shape: BoxShape.circle),
                    child: Image.asset('assets/icons/user-avatar.png'),
                  ),
                  SizedBox(
                    height: Height * 0.02,
                  ),
                  Container(
                    color: Colors.white,
                    width: Width - 20,
                    height: Height - 10,
                    child: Column(children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return " * required field";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.name,
                        controller: profileController.editnameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(width: 2, color: Colors.black),
                          ),
                          hintText: 'Enter your Name',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return " * required field";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: profileController.editemailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(width: 2, color: Colors.black),
                          ),
                          hintText: 'Enter your Email',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Mobile Number',
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return " * required field";
                          } else {
                            return null;
                          }
                        },
                        controller:
                            profileController.editmobilenumberController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(width: 2, color: Colors.black),
                          ),
                          hintText: 'Enter your Mobile Number',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Address',
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        // <-- TextFormField width
                        height: 120, // <-- TextFormField height
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return " * required field";
                            } else {
                              return null;
                            }
                          },
                          controller: profileController.editaddressController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.black),
                            ),
                            hintText: 'Enter your address here',
                          ),
                          maxLines: null,
                          expands: true,
                        ),
                      ),
                      SizedBox(
                        height: Height * 0.02,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              if (profilekey.currentState!.validate()) {
                                profileController.updateProfile(
                                    profileController.editnameController.text,
                                    profileController.editemailController.text,
                                    int.parse(profileController
                                        .editmobilenumberController.text),
                                    profileController
                                        .editaddressController.text);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            child: const Text(
                              'Update',
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            )),
                      )
                    ]),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
