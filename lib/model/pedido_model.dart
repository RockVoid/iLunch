import 'package:cloud_firestore/cloud_firestore.dart';

class PedidoModel {
  String id;
  final String title;
  final String description;
  final double price;
  final int unity;
  final String linkImage;
  final String vendedor;
  final String cliente;

  PedidoModel({
    this.id = '',
    required this.title,
    required this.description,
    required this.price,
    required this.unity,
    required this.linkImage,
    required this.vendedor,
    required this.cliente,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
        'unity': unity,
        'linkImage': linkImage,
        'vendedor': vendedor,
        'cliente': cliente,
      };

  static PedidoModel fromJson(Map<String, dynamic> json) => PedidoModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        unity: json['unity'],
        linkImage: json['linkImage'],
        vendedor: json['vendedor'],
        cliente: json['cliente'],
      );
}

Stream<List<PedidoModel>> readPedidos() => FirebaseFirestore.instance
    .collection('pedidos')
    .where('cliente', isEqualTo: 'Guilherme Alencar')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => PedidoModel.fromJson(doc.data())).toList());
