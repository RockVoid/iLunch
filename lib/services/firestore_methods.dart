import 'dart:core';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ilunch/model/product_model.dart';
import 'package:ilunch/services/storage_methods.dart';
import 'package:uuid/uuid.dart';
import 'package:ilunch/model/buyer_user_model.dart' as model;

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
    // asking uid here because we dont want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      String productID = const Uuid().v1();
      String imageUrl = await StorageMethods()
          .uploadImageToStorage('products', file, productID);
      // creates unique id based on time
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

  Future<String> switchBuyerUser(
    String username,
    String email,
    String buyerID,
    String stars,
    String whereToBuy,
    String number,
    Uint8List image,
    Uint8List backgroundImage,
    List products,
  ) async {
    // asking uid here because we dont want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      String imageUrl = await StorageMethods()
          .uploadImageToStorage('BuyerUsers', image, buyerID);
      String backgroundImageUrl = await StorageMethods()
          .uploadImageToStorage('BuyerUsers', backgroundImage, buyerID);

      model.BuyerUserModel _buyerUser = model.BuyerUserModel(
        username: username,
        email: email,
        uid: buyerID,
        salesman: 'true',
        stars: stars,
        image: imageUrl,
        backgroundImage: backgroundImageUrl,
        whereToBuy: whereToBuy,
        number: number,
        products: products,
      );

      _firestore.collection('BuyerUsers').doc(buyerID).set(_buyerUser.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
