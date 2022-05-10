import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ilunch/main.dart';
import 'package:ilunch/pages/auth_page.dart';
import 'package:ilunch/widgets/bottom_navigation.dart';

class iLunch extends StatefulWidget {
  const iLunch({Key? key}) : super(key: key);

  @override
  State<iLunch> createState() => _iLunchState();
}

class _iLunchState extends State<iLunch> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iLunch',
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return BottomNavigation();
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  children: [
                    Text('${snapshot.error}'),
                    Text('Aperte o botão para entrar novamente'),
                    ElevatedButton(
                      onPressed: () => main(),
                      child: Text('Reiniciar'),
                    ),
                  ],
                ),
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
          return AuthPage();
        },
      ),
    );
  }
}
