import 'package:alridafrieds/controller/user_controller.dart';
import 'package:alridafrieds/user/accounts/Search.dart';
import 'package:alridafrieds/user/accounts/cart.dart';
import 'package:alridafrieds/user/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:provider/provider.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Hieght = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff911f2a),
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            'Home',
            style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
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
        height: Hieght,
        width: Width,
        child: Consumer<UserController>(builder: (context, homeController, _) {
          return FutureBuilder(
              future: homeController.fetchUserData(context),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      )
                    : ListView(children: [
                        Column(
                          children: [
                            Container(
                              height: Hieght * 0.3,
                              width: Width,
                              child: ImageSlideshow(
                                /// Width of the [ImageSlideshow].
                                width: Width,

                                /// Height of the [ImageSlideshow].
                                height: 250,

                                /// The page to show when first creating the [ImageSlideshow].
                                initialPage: 0,

                                /// The color to paint the indicator.
                                indicatorColor: Colors.black,

                                /// The color to paint behind th indicator.
                                indicatorBackgroundColor: Colors.grey,

                                /// Called whenever the page in the center of the viewport changes.
                                onPageChanged: (value) {
                                  print('Page changed: $value');
                                },

                                /// Auto scroll interval.
                                /// Do not auto scroll with null or 0.
                                autoPlayInterval: 10000,

                                /// Loops back to first slide.
                                isLoop: true,

                                /// The widgets to display in the [ImageSlideshow].
                                /// Add the sample image file into the images folder
                                children: [
                                  Image.asset(
                                    "assets/carousel/cr1.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                  Image.asset(
                                    "assets/carousel/cr2.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                  Image.asset(
                                    "assets/carousel/cr3.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),

                            //Special offer

                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AlRidaMenu()),
                                      );
                                    },
                                    child: const Text(
                                      'Special Offer',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'poppins',
                                          fontSize: 18,
                                          color: Colors.black),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AlRidaMenu()),
                                      );
                                    },
                                    child: const Text(
                                      'viewall',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'poppins',
                                          color: Colors.grey),
                                    ),
                                  )
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AlRidaMenu()));
                                },
                                child: Container(
                                  height: 170,
                                  width: double.infinity,
                                  child: FutureBuilder(
                                      future: homeController.fetchProducts(
                                        'special offers',
                                        homeController.specialproductsList,
                                      ),
                                      builder: (context, snapshot) {
                                        return snapshot.connectionState ==
                                                ConnectionState.waiting
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                            : homeController
                                                    .specialproductsList.isEmpty
                                                ? const Center(
                                                    child: Text('No Items'),
                                                  )
                                                : ListView.separated(
                                                    separatorBuilder:
                                                        (context, index) =>
                                                            const SizedBox(
                                                      width: 5,
                                                    ),
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: homeController
                                                        .specialproductsList
                                                        .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                homeController
                                                                    .specialproductsList[
                                                                        index]
                                                                    .productImage,
                                                              ),
                                                              fit: BoxFit.fill),
                                                          color: Colors.grey,
                                                        ),
                                                        width: 280,
                                                      );
                                                    },
                                                  );
                                      }),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AlRidaMenu()),
                                      );
                                    },
                                    child: const Text(
                                      'Menu',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'poppins',
                                          fontSize: 18,
                                          color: Colors.black),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AlRidaMenu()),
                                      );
                                    },
                                    child: const Text(
                                      'viewall',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'poppins',
                                          color: Colors.grey),
                                    ),
                                  )
                                ],
                              ),
                            ),

                            //menu items

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 5),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AlRidaMenu()));
                                },
                                child: Container(
                                  height: 170,
                                  width: double.infinity,
                                  child: FutureBuilder(
                                      future: homeController.fetchProducts(
                                          'My Shop', homeController.menuList),
                                      builder: (context, snapshot) {
                                        return snapshot.connectionState ==
                                                ConnectionState.waiting
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                            : homeController
                                                    .specialproductsList.isEmpty
                                                ? const Center(
                                                    child: Text('No Items'),
                                                  )
                                                : ListView.separated(
                                                    itemCount: homeController
                                                        .menuList.length,
                                                    separatorBuilder:
                                                        (context, index) =>
                                                            const SizedBox(
                                                      width: 5,
                                                    ),
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          image:
                                                              DecorationImage(
                                                                  image:
                                                                      NetworkImage(
                                                                    homeController
                                                                        .menuList[
                                                                            index]
                                                                        .productImage,
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover),
                                                          // color: Colors.blue,
                                                        ),
                                                        width: 170,
                                                      );
                                                    },
                                                  );
                                        // return ListView(
                                        //   // This next line does the trick.
                                        //   scrollDirection: Axis.horizontal,
                                        //   children: <Widget>[
                                        // Container(
                                        //   decoration: BoxDecoration(
                                        //     borderRadius:
                                        //         BorderRadius.circular(10),
                                        //     image: const DecorationImage(
                                        //         image: AssetImage(
                                        //           "assets/menu/menu.png",
                                        //         ),
                                        //         fit: BoxFit.fill),
                                        //     // color: Colors.blue,
                                        //   ),
                                        //   width: 170,
                                        // ),
                                        //     const SizedBox(
                                        //       width: 5,
                                        //     ),
                                        //     Container(
                                        //       decoration: BoxDecoration(
                                        //         borderRadius:
                                        //             BorderRadius.circular(10),
                                        //         image: const DecorationImage(
                                        //             image: AssetImage(
                                        //               "assets/menu/bun.jpg",
                                        //             ),
                                        //             fit: BoxFit.fill),
                                        //         // color: Colors.blue,
                                        //       ),
                                        //       width: 170,
                                        //     ),
                                        //     const SizedBox(
                                        //       width: 5,
                                        //     ),
                                        //     Container(
                                        //       decoration: BoxDecoration(
                                        //         borderRadius:
                                        //             BorderRadius.circular(10),
                                        //         image: const DecorationImage(
                                        //             image: AssetImage(
                                        //               "assets/menu/mayo.jpeg",
                                        //             ),
                                        //             fit: BoxFit.fill),
                                        //         // color: Colors.blue,
                                        //       ),
                                        //       width: 170,
                                        //     ),
                                        //     const SizedBox(
                                        //       width: 5,
                                        //     ),
                                        //     Container(
                                        //       decoration: BoxDecoration(
                                        //         borderRadius:
                                        //             BorderRadius.circular(10),
                                        //         image: const DecorationImage(
                                        //             image: AssetImage(
                                        //               "assets/menu/miri.png",
                                        //             ),
                                        //             fit: BoxFit.fill),
                                        //         // color: Colors.blue,
                                        //       ),
                                        //       width: 170,
                                        //     ),
                                        //     const SizedBox(
                                        //       width: 5,
                                        //     ),
                                        //     Container(
                                        //       decoration: BoxDecoration(
                                        //         borderRadius:
                                        //             BorderRadius.circular(10),
                                        //         image: const DecorationImage(
                                        //             image: AssetImage(
                                        //               "assets/menu/kuboose.jpg",
                                        //             ),
                                        //             fit: BoxFit.fill),
                                        //         // color: Colors.blue,
                                        //       ),
                                        //       width: 170,
                                        //     ),
                                        //     const SizedBox(
                                        //       width: 5,
                                        //     ),
                                        //   ],
                                        // );
                                      }),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]);
              });
        }),
      ),
    );
  }
}
