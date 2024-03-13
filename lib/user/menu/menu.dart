import 'package:alridafrieds/user/accounts/Search.dart';
import 'package:alridafrieds/user/accounts/cart.dart';
import 'package:alridafrieds/user/menu/Breads.dart';
import 'package:alridafrieds/user/menu/Drinks.dart';
import 'package:alridafrieds/user/menu/Dip.dart';
import 'package:alridafrieds/user/menu/Spoffer.dart';
import 'package:alridafrieds/user/menu/FriedChicken.dart';

import 'package:flutter/material.dart';

class AlRidaMenu extends StatelessWidget {
  AlRidaMenu({super.key});

  List<Tab> tabs = [
    const Tab(child: Text("Special Offer")),
    const Tab(child: Text("Menu")),
    const Tab(child: Text("Dip")),
    const Tab(child: Text("Breads")),
    const Tab(child: Text("Drinks")),
  ];

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20), // Creates border
                color: Colors.white,
              ),
              tabAlignment: TabAlignment.start,
              indicatorColor: Colors.white,
              isScrollable: true,
              tabs: tabs,
              labelColor: const Color(0xff911f2a),
              unselectedLabelColor: Colors.white,
              indicatorPadding: const EdgeInsets.symmetric(vertical: 5),
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            backgroundColor: const Color(0xff911f2a),
            automaticallyImplyLeading: false,
            title: const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Menu',
                style: TextStyle(
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
          body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: Height,
              width: Width,
              // color: Colors.amber,
              child: TabBarView(
                children: [
                  //Special offer container  Special offer container  Special offer container  Special offer container  Special offer container  Special offer container  Special offer container
                  Container(child: const SpOffer()),

                  Container(child: const FriedChicken()),

                  Container(
                    child: const Dip(),
                  ),

                  Container(
                    child: const Breads(),
                  ),
                  Container(
                    child: const Drinks(),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
