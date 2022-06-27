import 'package:flutter/material.dart';
import 'package:ilunch/themes/app_themes.dart';
import 'package:ilunch/widgets/bottom_navigation.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Appthemes.stroke,
        ),
        child: TextField(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => BottomNavigation(
                  primaryIndex: 1,
                ),
              ),
            );
          },
          cursorColor: Appthemes.primary,
          decoration: InputDecoration(
            hintText: "Item ou loja",
            border: InputBorder.none,
            icon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Icon(
                    Icons.search,
                    color: Appthemes.primary,
                  ),
                ),
                Center(
                  child: Container(
                    width: 1,
                    height: 35,
                    color: Appthemes.primary,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
