import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilunch/themes/app_themes.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../themes/app_themes.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  CollectionReference products =
      FirebaseFirestore.instance.collection('Produto');
  List<Reference> refs = [];
  List<String> arquivos = [];
  bool loading = true;
  bool uploading = false;
  double total = 0;

  final _fomKey = GlobalKey<FormState>();
  var cnt = 0;

  var name = "";
  var descrition = "";
  var value = "";
  var local = "";

  final nameController = TextEditingController();
  final descritionController = TextEditingController();
  final valueController = TextEditingController();
  final cntController = TextEditingController();

  String refLastImg = "";

  // Lista de categorias dos produtos;
  static const categoryItems = <String>[
    'Salados',
    'Doces',
    'Almoço',
    'Bebidas',
    'Saudavel'
  ];
  final List<DropdownMenuItem<String>> _dropDownCategoryItems = categoryItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  String? _categorySelectValue;

  @override
  void dispose() {
    nameController.dispose();
    descritionController.dispose();
    valueController.dispose();
    cntController.dispose();
    super.dispose();
  }

  clearText() {
    nameController.clear();
    descritionController.clear();
    valueController.clear();
    cntController.clear();
  }

  void decrement() {
    setState(() {
      cnt--;
    });
  }

  void increment() {
    setState(() {
      cnt++;
    });
  }

  bool get isEmpty => cnt == 0;

  bool get isFull => cnt == 99;

  Future<XFile?> getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<UploadTask> upload(String path) async {
    File file = File(path);
    try {
      refLastImg = 'images/img-${DateTime.now().toString()}.jpg';
      return storage.ref(refLastImg).putFile(file);
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload: ${e.code}');
    }
  }

  pickAndUploadImage() async {
    XFile? file = await getImage();
    if (file != null) {
      UploadTask task = await upload(file.path);
      task.snapshotEvents.listen((TaskSnapshot snapshot) async {
        if (snapshot.state == TaskState.running) {
          setState(() {
            uploading = true;
            total = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          });
        } else if (snapshot.state == TaskState.success) {
          arquivos.add(await snapshot.ref.getDownloadURL());
          refs.add(snapshot.ref);
          setState(() => uploading = false);
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  loadImages() async {
    refs = (await storage.ref('images').listAll()).items;
    for (var ref in refs) {
      arquivos.add(await ref.getDownloadURL());
    }
    setState(() => loading = false);
  }

  deleteImage(int refLastimg) async {
    await storage.ref(refs[refLastimg].fullPath).delete();
    arquivos.removeAt(refLastimg);
    refs.removeAt(refLastimg);
    setState(() {});
  }

  Future<void> addUser() {
    return products
        .add({
          'nome': name,
          'descrition': descrition,
          'category': _categorySelectValue,
          'value': value,
          'quantidade': cnt,
          'imgName': refs[arquivos.length - 1].fullPath
        })
        .then((value) => print('Product Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.red,
        titleSpacing: 20.0,
        title: uploading
            ? Text(
                '${total.round()}% enviado',
                style: GoogleFonts.poppins(
                  color: Appthemes.blackColor,
                  fontWeight: FontWeight.w400,
                ),
              )
            : Text(
                'Adicionar produto',
                style: GoogleFonts.poppins(
                  color: Appthemes.blackColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
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
                    labelText: 'Name: ',
                    labelStyle: GoogleFonts.poppins(
                      color: Appthemes.greySubtitle,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  cursorHeight: 20,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Descrição:',
                    labelStyle: GoogleFonts.poppins(
                      color: Appthemes.greySubtitle,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(),
                    errorStyle: GoogleFonts.poppins(
                      color: Appthemes.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  controller: descritionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter descrition';
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
                    labelText: 'Valor:',
                    labelStyle: GoogleFonts.poppins(
                      color: Appthemes.greySubtitle,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(),
                    errorStyle: GoogleFonts.poppins(
                      color: Appthemes.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  controller: valueController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Value';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Categoria:',
                    style: GoogleFonts.poppins(
                      color: Appthemes.blackColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: DropdownButton(
                    value: _categorySelectValue,
                    hint: Text(
                      'Escolha',
                      style: GoogleFonts.poppins(
                        color: Appthemes.greySubtitle,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() => _categorySelectValue = newValue);
                      }
                    },
                    items: _dropDownCategoryItems,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.9, 0.47),
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Quantidade Por Porção',
                        style: GoogleFonts.poppins(
                          color: Appthemes.blackColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 13.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Center(
                              child: IconButton(
                                icon: const Icon(Icons.minimize, size: 18),
                                color: const Color(0xFFFF0000),
                                padding: EdgeInsets.all(5),
                                constraints: BoxConstraints(
                                  minWidth: 35,
                                  minHeight: 35,
                                ),
                                onPressed: isEmpty ? null : decrement,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                '$cnt',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Appthemes.blackColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add, size: 18),
                              color: const Color(0xFFFF0000),
                              padding: EdgeInsets.all(5),
                              constraints: BoxConstraints(
                                minWidth: 35,
                                minHeight: 35,
                              ),
                              onPressed: isFull ? null : increment,
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
              Container(
                padding: const EdgeInsets.all(24.0),
                child: refLastImg.isEmpty //arquivos.isEmpty
                    ? const Center(child: Text('Não há imagens ainda.'))
                    : Image.network(
                        arquivos[arquivos.length - 1],
                        fit: BoxFit.cover,
                      ),
              ),
              refLastImg.isEmpty
                  ? Center()
                  : IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        deleteImage(arquivos.length - 1);
                        refLastImg = "";
                      },
                    ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.0),
                width: 3,
                height: 50,
                child: ElevatedButton(
                  onPressed: pickAndUploadImage,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                  child: Text(
                    "Adicionar Imagem",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.0),
                width: 3,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_fomKey.currentState!.validate()) {
                      setState(() {
                        name = nameController.text;
                        descrition = descritionController.text;
                        value = valueController.text;
                        cnt;
                        addUser();
                        clearText();
                        refLastImg = "";
                      });
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                  child: Text(
                    "Adicionar Produto",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
