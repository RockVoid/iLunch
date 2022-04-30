import 'package:flutter/material.dart';
import 'package:ilunch/pages/authenticator.dart';

void main() {
  runApp(const iLunch());
}

class iLunch extends StatefulWidget {
  const iLunch({Key? key}) : super(key: key);

  @override
  State<iLunch> createState() => _iLunchState();
}

class _iLunchState extends State<iLunch> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Authenticator(),
    );
  }
}
