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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  Uint8List? _image;
  Uint8List? _backgroundImage;
  bool _isLoading = false;
  String? _errorText;

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  void switchBueyrUser() async {
    setState(() {
      _isLoading = true;
    });
    String? res = await FireStoreMethods().switchBuyerUser(
        _nomeController.text,
        _emailController.text,
        widget.userData['uid'],
        '0',
        'IFCE',
        _numberController.text,
        _image!,
        _backgroundImage!, []);
    setState(() {
      _isLoading = false;
    });
    if (res == 'success') {
      setState(() {
        _errorText = res;
      });
      ShowSnackBar('Usuário Cadastrado com sucesso', context);
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
          children: [
            SizedBox(
              height: 25,
            ),
            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(_image!),
                        backgroundColor: Colors.red,
                      )
                    : const CircleAvatar(
                        radius: 64,
                        backgroundImage:
                            AssetImage('assets/images/person_icon2.png'),
                        backgroundColor: Colors.transparent,
                      ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: selectImage,
                    icon: const Icon(Icons.add_a_photo),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            TextFieldInput(
              textEditingController: _nomeController,
              hintText: 'Nome do vendedor',
              textInputType: TextInputType.name,
            ),
            SizedBox(
              height: 15,
            ),
            TextFieldInput(
              textEditingController: _emailController,
              hintText: 'Email',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 15,
            ),
            TextFieldInput(
              textEditingController: _numberController,
              hintText: 'Número de celular',
              textInputType: TextInputType.number,
            ),
            ElevatedButtonWidget(
              child: Text(
                'Cadastrar Vendedor',
                style: GoogleFonts.poppins(
                  color: Appthemes.background,
                  fontWeight: FontWeight.w500,
                  fontSize: 18
                ),
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
