import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ilunch/widgets/show_snack_bar.dart';

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
      TextError = "Preencha todos os campos";
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
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
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
      _errorText = res;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Cadastro",
                  style: TextStyle(
                    color: Color(0xffea1d2c),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.facebook),
              ),
              Divider(),
              IconButton(
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.google),
              ),
            ],
          ),
          Divider(),
          Divider(),
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffffffff),
              labelText: "Nome Completo",
              errorText: TextErrorEmpty(_errorText),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0x00000000)),
              ),
            ),
          ),
          Divider(),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffffffff),
              labelText: "E-mail",
              hintText: "exemplo@gmai.com",
              errorText: TextErrorEmpty(_errorText),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0x000000000)),
              ),
            ),
          ),
          Divider(),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffffffff),
              labelText: "Senha",
              hintText: "Pelo menos 8 caracteres!",
              errorText: TextErrorPassword(_errorText),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0x000000000)),
              ),
            ),
          ),
          Divider(),
          TextFormField(
            controller: _passwordConfirmController,
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffffffff),
              labelText: "Confirmar senha",
              hintText: "Redigite a senha!",
              errorText: TextErrorPassword(_errorText),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0x000000000)),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffea1d2c),
              fixedSize: const Size(3000, 55),
            ),
            onPressed: signUpUser,
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Text(
                    "Cadastrar",
                    style: TextStyle(
                      color: Color(0xfff6f6f6),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
