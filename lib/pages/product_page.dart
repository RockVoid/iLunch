import 'package:flutter/material.dart';

class produto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.topRight,
            child: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  (Image.asset('assets/images/divinapicanha.png',
                      height: 200, width: 380, fit: BoxFit.cover)),
                ]))));
  }
}
