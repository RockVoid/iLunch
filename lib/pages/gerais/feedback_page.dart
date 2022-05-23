import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.red,
          titleSpacing: 0.0,
        ),
        body: Center(
            child: Text(
          "Feedback",
          style: TextStyle(fontSize: 60),
        )),
      );
}