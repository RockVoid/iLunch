import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ilunch/pages/gerais/cupons_page.dart';
import 'package:ilunch/pages/gerais/home_page.dart';
import 'package:ilunch/pages/gerais/profile_page.dart';
import 'package:ilunch/pages/gerais/search_page.dart';
import 'package:ilunch/pages/vendedor/store_administration_page.dart';
import 'package:ilunch/themes/app_themes.dart';

class BottomNavigation extends StatefulWidget {
  final int? primaryIndex;
  const BottomNavigation({Key? key, this.primaryIndex}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  static bool verifyBuyer = false;
  Map<String, dynamic> userData = {};

  bool isBuyerOrNot(String data) {
    if (data.toLowerCase() == 'true') {
      return true;
    } else {
      return false;
    }
  }

  void getBuyer() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userSnap = await FirebaseFirestore
          .instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      userData = userSnap.data()!;
      setState(() {
        verifyBuyer = isBuyerOrNot(userData['salesman']);
        if (verifyBuyer == true) {
          screens.removeAt(3);
          screens.add(StoreAdministrationPage(
            uid: userData['uid'],
          ));
        }
      });
    } catch (e) {}
  }

  void diferentIndex(int? newIndex) {
    if (newIndex != null) {
      setState((){
        _currentIndex = newIndex;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    diferentIndex(widget.primaryIndex);
    getBuyer();
  }

  List<Widget> screens = [
    HomePage(),
    SearchPage(),
    CuponsPage(),
    ProfilePage(
      verifyBuyer,
      uid: FirebaseAuth.instance.currentUser!.uid,
    )
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
