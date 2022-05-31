import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/bottom_navigation_bar.dart';

class CuponPage extends StatefulWidget {
  const CuponPage({Key? key}) : super(key: key);

  @override
  State<CuponPage> createState() => _CuponPageState();
}

class _CuponPageState extends State<CuponPage> {
  final Stream<QuerySnapshot> cupomStream =
      FirebaseFirestore.instance.collection('cupon').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: cupomStream,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id;
          }).toList();
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              automaticallyImplyLeading: true,
              backgroundColor: Colors.red,
              titleSpacing: 0.0,
            ),
            body: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 35, horizontal: 30),
                child: ListView(
                  children: [
                    Container(
                      child: Text(
                        "Cupons Promocionais",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    //Quando Criar o documento "cupon", tirar os comentarios do for e da variável
                    for (var i = 0; i < storedocs.length; i++) ...[
                      Container(
                        width: 200,
                        height: 65,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              alignment: Alignment.centerLeft,
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          child: Text(
                            //"Ilunch | Promoção de Dias das Mães",
                            storedocs[i]['nome'],
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ),
          );
        });
  }
}
