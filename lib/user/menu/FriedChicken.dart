import 'package:alridafrieds/controller/user_controller.dart';
import 'package:alridafrieds/user/menu/ItemDetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FriedChicken extends StatelessWidget {
  const FriedChicken({super.key});

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;

    return Consumer<UserController>(builder: (context, friedController, _) {
      return FutureBuilder(
          future: friedController.fetchProducts(
              'My Shop', friedController.menuList),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : friedController.specialproductsList.isEmpty
                    ? const Center(
                        child: Text('No Items'),
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 4.4 / 5,
                        ),
                        itemCount: friedController.menuList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            // onTap: () {
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => items[index]['page'],
                            //       ));
                            // },
                            child: Container(
                              // margin: EdgeInsets.symmetric(horizontal: Width),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: Width * 0.005,
                                        vertical: Height * 0.005),
                                    height: Height * 0.145,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            friedController
                                                .menuList[index].productImage,
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: Height*0.006,
                                  // ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: Width * 0.005,
                                      ),
                                      Text(
                                        friedController
                                            .menuList[index].productTitle,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'poppins',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                      Image.asset(
                                        'assets/icons/non-veg.png',
                                        width: Height * 0.018,
                                      ),
                                      SizedBox(
                                        width: Width * 0.008,
                                      ),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   height: 5,
                                  // ),
                                  const Spacer(),
                                  SizedBox(
                                    height: Height * 0.05,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: Width * 0.005),
                                      child: ElevatedButton(
                                        onPressed: () {
                                           friedController.addtoCart(
                                              friedController
                                                  .menuList[index].productID,
                                              friedController
                                                  .menuList[index].productTitle,
                                              friedController.menuList[index]
                                                  .productDescription,
                                              friedController
                                                  .menuList[index].productPrice,
                                              1,
                                              context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xff3c8a3c),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10.0), // Adjust the radius as needed
                                          ),
                                        ),
                                        child: Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Add',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'poppins',
                                                fontSize: 15,
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              "₹ ${friedController.menuList[index].productPrice.toString()}",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'poppins',
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          );
                        },
                      );
          });
    });
  }
}
