import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String username;
  final String email;
  final String uid;
  final String image;
  final String salesman;
  final String whereToBuy;
  final String number;

  UserModel({
    required this.username,
    required this.email,
    required this.image,
    required this.uid,
    required this.salesman,
    required this.whereToBuy,
    required this.number,
  });

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      image: snapshot["image"],
      salesman: snapshot['salesman'],
      whereToBuy: snapshot['whereToBuy'],
      number: snapshot['number'],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "image": image,
        "salesman": salesman,
        "whereToBuy": whereToBuy,
        "number": number,
      };
}
