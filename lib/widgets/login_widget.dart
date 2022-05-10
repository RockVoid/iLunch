import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ilunch/widgets/show_snack_bar.dart';
import '../services/auth_methods.dart';
import 'bottom_navigation.dart';

class LoginWidgtet extends StatefulWidget {
  const LoginWidgtet({Key? key}) : super(key: key);

  @override
  State<LoginWidgtet> createState() => _LoginWidgtetState();
}

class _LoginWidgtetState extends State<LoginWidgtet> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorText;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  String? TextErrorEmpty(String? Text) {
    String? TextError;
    if (Text == 'error-E') {
      TextError = "Preencha todos os campos";
    } else if (Text ==
        'The password is invalid or the user does not have a password.') {
      TextError = "Valores inválidos";
    } else {
      TextError = null;
    }
    return TextError;
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String? res = await AuthMethods().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
    setState(() {
      _isLoading = false;
    });
    if (res == 'success') {
      _emailController.text = '';
      _passwordController.text = '';
      _errorText = res;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BottomNavigation(),
        ),
      );
    } else if (res ==
        'The password is invalid or the user does not have a password') {
      _errorText = res;
      ShowSnackBar("Email ou senha inválidos", context);
    } else if (res == 'error-E') {
      _errorText = res;
      ShowSnackBar("Preencha todos os campos.", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffffffff),
              labelText: "Login",
              hintText: "E-mail ou Número de Celular",
              errorText: TextErrorEmpty(_errorText),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xff222222)),
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffffffff),
              labelText: "Senha",
              errorText: TextErrorEmpty(_errorText),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xff222222)),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Esqueceu a senha?",
              style: TextStyle(color: Color(0xffea1d2c)),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: loginUser,
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xfff6f6f6),
                          ),
                        ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffea1d2c),
                    fixedSize: const Size(3000, 55),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "ou",
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: FaIcon(
                    FontAwesomeIcons.facebook,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Login com o Facebook",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xfff6f6f6),
                    ),
                  ),
                ),
              ],
            ),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xff4062bb),
              fixedSize: const Size(3000, 55),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: FaIcon(
                    FontAwesomeIcons.google,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.5),
                  child: Text(
                    "Login com o Google",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xfff6f6f6),
                    ),
                  ),
                ),
              ],
            ),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffea1d2c),
              fixedSize: const Size(3000, 55),
            ),
          ),
        ],
      ),
    );
  }
}
