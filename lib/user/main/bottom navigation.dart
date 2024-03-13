import 'package:alridafrieds/user/main/accounts.dart';
import 'package:alridafrieds/user/main/homepage.dart';
import 'package:alridafrieds/user/menu/menu.dart';
import 'package:flutter/material.dart';

//CAROUSEL
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _SelectedCurrentIndex = 0;
  final _pages = [HomeContent(), AlRidaMenu(), const Accounts(),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_SelectedCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        backgroundColor: const Color(0xff911f2a),
        currentIndex: _SelectedCurrentIndex,
        onTap: (newIndex) {
          setState(() {
            _SelectedCurrentIndex = newIndex;
          });
        },
        // unselectedItemColor: Colors.black,
        // selectedItemColor: Colors.white,

        items: [
          const BottomNavigationBarItem(
            label: 'Home',
            icon: ImageIcon(
              AssetImage(
                "assets/icons/home.png",
              ),
            ),
          ),
          const BottomNavigationBarItem(
            label: 'Menu',
            icon: ImageIcon(
              AssetImage(
                "assets/icons/menu.png",
              ),
            ),
          ),
          const BottomNavigationBarItem(
            label: 'Account',
            icon: ImageIcon(
              AssetImage(
                "assets/icons/user.png",
              ),
            ),
          )
        ],
        selectedIconTheme:
            const IconThemeData(color: Colors.white), // Set selected icon color
        selectedLabelStyle:
            const TextStyle(color: Colors.white, fontFamily: 'poppins'),
        unselectedLabelStyle: const TextStyle(
            color: Colors.black,
            fontFamily: 'poppins'), // Set selected label color
      ),
    );
  }
}
