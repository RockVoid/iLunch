import 'package:flutter/material.dart';
import 'package:ilunch/pages/gerais/search_page.dart';
import 'package:ilunch/pages/gerais/home_page.dart';
import 'package:ilunch/pages/gerais/cupon_page.dart';
import 'package:ilunch/pages/vendedor/store_administration_page.dart';
import 'package:ilunch/themes/app_themes.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final screens = [
    HomePage(),
    SearchPage(),
    CuponPage(),
    StoreAdministrationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 28,
          backgroundColor: Colors.white,
          selectedItemColor: Appthemes.primary,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Pesquisa",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_num_sharp),
              label: "Cupons",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_outlined),
              label: "Profile",
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
