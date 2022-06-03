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
    this.image = 'null',
    required this.uid,
    this.salesman = 'false',
    this.whereToBuy = 'null',
    this.number = 'null',
  });

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      username: snapshot["name"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      image: snapshot["image"],
      salesman: snapshot['salesman'],
      whereToBuy: snapshot['whereToBuy'],
    );
  }

  Map<String, dynamic> toJson() => {
    "username": username,
    "uid": uid,
    "email": email,
    "image": image,
    "salesman": salesman,
    "whereToBuy": whereToBuy,
  };

}