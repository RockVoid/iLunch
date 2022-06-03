import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilunch/themes/app_themes.dart';
import 'package:ilunch/widgets/elevated_button_widget.dart';
import 'package:ilunch/widgets/show_snack_bar.dart';
import 'package:ilunch/widgets/text_field_input.dart';

import '../services/auth_methods.dart';
import 'bottom_navigation.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  String? _errorText;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
  }

  String? TextErrorEmpty(String? Text) {
    String? TextError;
    if (Text == 'error-E') {
      setState(() {
        TextError = "Preencha todos os campos";
      });
    } else {
      TextError = null;
    }
    return TextError;
  }

  String? TextErrorPassword(String? Text) {
    String? TextError;
    if (Text == 'error-P') {
      TextError = "Senhas não coincidem";
    } else if (Text == 'error-E') {
      TextError = "Preencha todos os campos";
    } else {
      TextError = null;
    }
    return TextError;
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String? res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      passwordConfirm: _passwordConfirmController.text,
      username: _usernameController.text,
    );
    print(res);
    setState(() {
      _isLoading = false;
    });
    if (res == 'success') {
      _emailController.text = '';
      _usernameController.text = '';
      _passwordController.text = '';
      _passwordConfirmController.text = '';
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "Cadastro",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xffea1d2c),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.black,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: Colors.white,
                    elevation: 4,
                    padding: EdgeInsets.zero,
                    minimumSize: Size(50, 50),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.black,
                    size: 20,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: Colors.white,
                    elevation: 4,
                    padding: EdgeInsets.zero,
                    minimumSize: Size(50, 50),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          TextFieldInput(
            textEditingController: _usernameController,
            hintText: 'Nome Completo',
            textInputType: TextInputType.emailAddress,
            errorText: TextErrorEmpty(_errorText),
          ),
          SizedBox(height: 10),
          TextFieldInput(
            textEditingController: _emailController,
            hintText: 'E-mail',
            textInputType: TextInputType.emailAddress,
            errorText: TextErrorEmpty(_errorText),
          ),
          SizedBox(height: 10),
          TextFieldInput(
            textEditingController: _passwordController,
            hintText: 'Senha',
            textInputType: TextInputType.visiblePassword,
            errorText: TextErrorPassword(_errorText),
            isPass: true,
          ),
          SizedBox(height: 10),
          TextFieldInput(
            textEditingController: _passwordConfirmController,
            hintText: 'Confirmar senha',
            textInputType: TextInputType.visiblePassword,
            errorText: TextErrorPassword(_errorText),
            isPass: true,
          ),
          SizedBox(height: 35),
          ElevatedButtonWidget(
            bottom: 35,
            onPressed: signUpUser,
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Text(
                    "Cadastro",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Appthemes.background,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
