import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilunch/services/firestore_methods.dart';
import 'package:ilunch/widgets/elevated_button_widget.dart';
import 'package:ilunch/widgets/text_field_input.dart';
import 'package:image_picker/image_picker.dart';

import '../../themes/app_themes.dart';
import '../../themes/utils.dart';
import '../../widgets/bottom_navigation.dart';
import '../../widgets/show_snack_bar.dart';

class SwitchBuyerPage extends StatefulWidget {
  final Map userData;

  const SwitchBuyerPage({Key? key, required this.userData}) : super(key: key);

  @override
  State<SwitchBuyerPage> createState() => _SwitchBuyerPageState();
}

class _SwitchBuyerPageState extends State<SwitchBuyerPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  Uint8List? _image;
  Uint8List? _backgroundImage;
  bool _isLoading = false;
  String? _errorText;

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  selectBackgroundImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _backgroundImage = im;
    });
  }

  void switchBueyrUser() async {
    setState(() {
      _isLoading = true;
    });
    String? res = await FireStoreMethods().switchBuyerUser(
      username: _nomeController.text,
      email: widget.userData['email'],
      buyerID: widget.userData['uid'],
      stars: '5',
      whereToBuy: 'IFCE',
      number: _numberController.text,
      image: _image!,
      backgroundImage: _backgroundImage!,
      products: [],
    );
    setState(() {
      _isLoading = false;
    });
    if (res == 'success') {
      setState(() {
        _errorText = res;
      });
      ShowSnackBar('Vendedor cadastrado com sucesso', context);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BottomNavigation(),
        ),
      );
    } else {
      setState(() {
        _errorText = res;
      });
    }
  }

  String? TextError(String? Text) {
    String? TextError;
    if (Text == 'error-E') {
      TextError = "Preencha todos os campos";
    } else {
      TextError = null;
    }
    return TextError;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastro',
          style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.8),
        ),
        centerTitle: true,
        elevation: 5,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.red,
        titleSpacing: 20.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: _backgroundImage == null ? Colors.grey : null,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                    image: _backgroundImage != null
                        ? DecorationImage(
                            image: MemoryImage(_backgroundImage!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.6),
                      ],
                      stops: [0.0, 0.5],
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 21, right: 21, top: 0, bottom: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                _image != null
                                    ? CircleAvatar(
                                        radius: 55,
                                        backgroundImage: MemoryImage(_image!),
                                        backgroundColor: Colors.transparent,
                                      )
                                    : const CircleAvatar(
                                        radius: 55,
                                        backgroundImage: AssetImage(
                                          'assets/images/person_icon.png',
                                        ),
                                        backgroundColor: Colors.transparent,
                                      ),
                                Positioned(
                                  child: IconButton(
                                    onPressed: selectImage,
                                    icon: Icon(Icons.camera_alt_outlined),
                                    color: Colors.redAccent,
                                  ),
                                  bottom: -10,
                                  right: -10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: IconButton(
                    onPressed: selectBackgroundImage,
                    icon: Icon(Icons.camera_alt_outlined),
                    color: Colors.red,
                  ),
                  bottom: 0,
                  right: 2,
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                widget.userData['email'],
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldInput(
              textEditingController: _nomeController,
              hintText: 'Nome do vendedor',
              textInputType: TextInputType.name,
              errorText: TextError(_errorText),
            ),
            SizedBox(
              height: 15,
            ),
            TextFieldInput(
              textEditingController: _numberController,
              hintText: 'Número de celular',
              textInputType: TextInputType.number,
              formatters: [Mask().phoneNumber.formatter],
              errorText: TextError(_errorText),
            ),
            ElevatedButtonWidget(
              child: _isLoading
                  ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      'Cadastrar Vendedor',
                      style: GoogleFonts.poppins(
                          color: Appthemes.background,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
              onPressed: switchBueyrUser,
              top: 20,
            )
          ],
        ),
      ),
    );
  }
}
