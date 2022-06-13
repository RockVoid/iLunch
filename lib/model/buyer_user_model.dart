import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ilunch/widgets/product_tile.dart';

class BuyerUserModel {
  final String username;
  final String email;
  final String uid;
  final String stars;
  final String category;
  final String image;
  final String backgroundImage;
  final String salesman;
  final String whereToBuy;
  final String number;
  final List products;

  BuyerUserModel({
    required this.username,
    required this.email,
    required this.uid,
    required this.stars,
    required this.category,
    required this.image,
    required this.backgroundImage,
    required this.salesman,
    required this.whereToBuy,
    required this.number,
    required this.products,
  });

  static BuyerUserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return BuyerUserModel(
      username: snapshot["username"],
      email: snapshot["email"],
      uid: snapshot["uid"],
      stars: snapshot["stars"],
      category: snapshot["category"],
      image: snapshot["image"],
      backgroundImage: snapshot["backgroundImage"],
      salesman: snapshot["salesman"],
      whereToBuy: snapshot["whereToBuy"],
      number: snapshot["number"],
      products: snapshot["products"],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "uid": uid,
        "stars": stars,
        "category": category,
        "image": image,
        "backgroundImage": backgroundImage,
        "salesman": salesman,
        "whereToBuy": whereToBuy,
        "number": number,
        "products": products,
      };
}

Stream<List<BuyerUserModel>> readBuyerUser() => FirebaseFirestore.instance
    .collection('BuyerUsers')
    .snapshots()
    .map((snapshot) => snapshot.docs
        .map((doc) => BuyerUserModel.fromSnap(doc))
        .toList());
