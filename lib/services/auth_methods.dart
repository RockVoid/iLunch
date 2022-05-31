import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ilunch/model/user_model.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.UserModel.fromSnap(documentSnapshot);
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String passwordConfirm,
    required String username,
  }) async {
    String res = 'Ocorreu algum erro';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty) {
        if (password == passwordConfirm) {
          UserCredential userCredential =
              await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

          model.UserModel _user = model.UserModel(
            username: username,
            email: email,
            uid: userCredential.user!.uid,
            salesman: 'true',
          );

          _firestore
              .collection('Users')
              .doc(userCredential.user!.uid)
              .set(_user.toJson());
          return res = 'success';
        } else {
          return res = 'error-P';
        }
      } else {
        res = 'error-E';
        return res;
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
