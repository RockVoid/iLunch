import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  List<Reference> refs = [];
  List<String> arquivos = [];
  bool loading = true;
  bool uploading = false;
  double total = 0;

  final _fomKey = GlobalKey<FormState>();
  final estilo = TextStyle(fontSize: 30);
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

  void zerar() {
    setState(() {
      cnt == Null;
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

  CollectionReference students =
      FirebaseFirestore.instance.collection('Produto');

  Future<void> addUser() {
    return students
        .add({
          'nome': name,
          'descrition': descrition,
          'value': value,
          'quantidade': cnt,
          'imgName': refs[arquivos.length - 1].fullPath
        })
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.red,
        titleSpacing: 20.0,
        title: uploading
            ? Text('${total.round()}% enviado')
            : const Text('Adicionar produto'),
      ),
      body: Form(
        key: _fomKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: TextFormField(
                autofocus: false,
                decoration: InputDecoration(
                  labelText: 'Name: ',
                  labelStyle: TextStyle(fontSize: 20.0),
                  border: OutlineInputBorder(),
                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
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
                  labelText: 'Descrição: ',
                  labelStyle: TextStyle(fontSize: 20.0),
                  border: OutlineInputBorder(),
                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
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
                  labelText: 'Value: ',
                  labelStyle: TextStyle(fontSize: 20.0),
                  border: OutlineInputBorder(),
                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
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
            Align(
              alignment: AlignmentDirectional(0.9, 0.47),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Quantidade Por Porção',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.minimize, size: 18),
                            color: const Color(0xFFFF0000),
                            onPressed: isEmpty ? null : decrement,
                          ),
                          Text(
                            '$cnt',
                            textAlign: TextAlign.center,
                          ),
                          IconButton(
                            icon: const Icon(Icons.add, size: 18),
                            color: const Color(0xFFFF0000),
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
          ]),
        ),
      ),
    );
  }
}
