import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String title;
  final String buyerID;
  final String productID;
  final String description;
  final String category;
  final double value;
  final int unity;
  final String image;

  ProductModel({
    required this.title,
    required this.buyerID,
    required this.description,
    required this.category,
    required this.productID,
    required this.value,
    required this.unity,
    required this.image,
  });

  // Nomes das variavéis para os Maps.
  static String titleMap = 'title';
  static String buyerIDMap = 'buyerID';
  static String productIDMap = 'productID';
  static String descriptionMap = 'description';
  static String categoryMap = 'category';
  static String valueMap = 'value';
  static String unityMap = 'unity';
  static String imageMap = 'image';

  // Função para receber as variáveis do Firebase
  static ProductModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return ProductModel(
      title: snapshot[titleMap],
      buyerID: snapshot[buyerIDMap],
      productID: snapshot[productIDMap],
      description: snapshot[descriptionMap],
      category: snapshot[categoryMap],
      value: snapshot[valueMap],
      unity: snapshot[unityMap],
      image: snapshot[imageMap],
    );
  }

  // Função para transformar as variáveis para o modelo Json.
  Map<String, dynamic> toJson() => {
    titleMap: title,
    buyerIDMap: buyerID,
    productIDMap: productID,
    descriptionMap: description,
    categoryMap: category,
    valueMap: value,
    unityMap: unity,
    imageMap: image,
  };
}