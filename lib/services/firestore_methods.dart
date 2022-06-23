import 'dart:core';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ilunch/model/product_model.dart';
import 'package:ilunch/services/storage_methods.dart';
import 'package:uuid/uuid.dart';
import 'package:ilunch/model/buyer_user_model.dart' as model;

import '../model/user_model.dart' as model;

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadProduct(
    String title,
    String buyerID,
    String productID,
    String description,
    String category,
    double value,
    int unity,
    Uint8List file,
  ) async {
    String res = "Some error occurred";
    try {
      String productID = const Uuid().v1();
      String imageUrl = await StorageMethods()
          .uploadImageToStorage('products', file, productID);

      ProductModel product = ProductModel(
        title: title,
        buyerID: buyerID,
        productID: productID,
        description: description,
        category: category,
        value: value,
        unity: unity,
        image: imageUrl,
      );
      _firestore.collection('products').doc(productID).set(product.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> switchBuyerUser({
    required String username,
    required String email,
    required String buyerID,
    required String stars,
    required String whereToBuy,
    required String number,
    required Uint8List image,
    required Uint8List backgroundImage,
    required List products,
  }) async {
    String res = "Some error occurred";
    try {
      if (username != "" || number != "") {
        String imageUrl = await StorageMethods()
            .uploadImageToStorage('BuyerUsers', image, buyerID);
        String backgroundImageUrl = await StorageMethods()
            .uploadImageToStorage('BuyerUsers', backgroundImage, buyerID);

        model.BuyerUserModel _buyerUser = model.BuyerUserModel(
          username: username,
          email: email.toLowerCase(),
          uid: buyerID,
          salesman: 'true',
          stars: stars,
          image: imageUrl,
          backgroundImage: backgroundImageUrl,
          whereToBuy: 'IFCE',
          number: number,
          products: products,
        );

        _firestore
            .collection('BuyerUsers')
            .doc(buyerID)
            .set(_buyerUser.toJson());

        model.UserModel _user = model.UserModel(
          username: username,
          email: email.toLowerCase(),
          image: imageUrl,
          uid: buyerID,
          salesman: 'true',
          whereToBuy: 'IFCE',
          number: number,
        );

        _firestore.collection('Users').doc(buyerID).update(_user.toJson());

        res = "success";
      } else {
        res = "error-E";
        return res;
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
