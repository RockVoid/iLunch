import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

//

class _CardPageState extends State<CardPage> {
  final _fomKey = GlobalKey<FormState>();

  var name = "";
  var date = "";
  var number = "";
  var cpf = "";
  String? selectedItem = "Tipo de cartão";

  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final numberController = TextEditingController();
  final cpfController = TextEditingController();
  final selectedItemController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    dateController.dispose();
    numberController.dispose();
    cpfController.dispose();
    selectedItemController.dispose();
    super.dispose();
  }

  clearText() {
    nameController.clear();
    dateController.clear();
    numberController.clear();
    cpfController.clear();
  }

  // Adding Student
  CollectionReference students =
      FirebaseFirestore.instance.collection('students');

  final Stream<QuerySnapshot> tipeStream =
      FirebaseFirestore.instance.collection('tipeCard').snapshots();

  Future<void> addUser() {
    return students
        .add({
          'nome': name,
          'date': date,
          'number': number,
          'cpf': cpf,
          'tipo': selectedItem
        })
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }
  //for (var i = 0; i < storedocs.length; i++) ...[
  //if(storedocs[i]['id']] == "id"){
  //storedocs[i]['id']]
  //   }
  //];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: tipeStream,
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

          List<String> items = [
            'Tipo de cartão',
            for (var i = 0; i < storedocs.length; i++) ...[storedocs[i]['nome']]
          ];
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              automaticallyImplyLeading: true,
              backgroundColor: Colors.red,
              titleSpacing: 0.0,
            ),
            body: Form(
              key: _fomKey,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: 'Nome do Carão',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nome do Carão';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                        child: SizedBox(
                      width: 200,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    width: 1, color: Colors.black26))),
                        value: selectedItem,
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(fontSize: 30),
                                  ),
                                ))
                            .toList(),
                        onChanged: (item) => setState(() {
                          selectedItem = item;
                          print("valor" + selectedItem!);
                        }),
                      ),
                    )),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: 'Data de vencimento',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: dateController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Data de vencimento';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: 'N° do Cartão',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: numberController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'N° do Cartão';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: 'CPF/CNPJ do titular',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: cpfController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'CPF/CNPJ do titular';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      width: 3,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, otherwise false.
                          if (_fomKey.currentState!.validate()) {
                            setState(() {
                              name = nameController.text;
                              date = dateController.text;
                              number = numberController.text;
                              cpf = cpfController.text;
                              //selectedItem = selectedItemController.text;
                              addUser();
                              clearText();
                            });
                          }
                        },
                        style: ButtonStyle(
                            alignment: Alignment.centerLeft,
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        child: Text(
                          "Adicionar Cartão",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
