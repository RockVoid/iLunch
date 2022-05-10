import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String passwordConfirm,
    required String username,
  }) async {
    String res = 'Ocorreu algum erro';
    try {
      if (email.isNotEmpty && password.isNotEmpty && password.isNotEmpty &&
          username.isNotEmpty) {
        if (password == passwordConfirm) {
          UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          print(userCredential.user!.uid);

          _firestore.collection('buyerUser').doc(userCredential.user!.uid).set({
            "username": username,
            "email": email,
            "uid": userCredential.user!.uid,
            'salesman': false,
          });
        } else {
          return res = 'error-P';
        }
        return res = 'success';
      } else {
        return res = 'error-E';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'Ocorreu algum error';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = 'success';
      } else {
        res = 'error-E';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}