import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilunch/themes/app_themes.dart';
import 'package:ilunch/widgets/elevated_button_widget.dart';
import 'package:ilunch/widgets/show_snack_bar.dart';
import 'package:ilunch/widgets/text_field_input.dart';
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
  bool _isLoadingLoginEmail = false;
  bool _isLoadingLoginFaceBook = false;
  bool _isLoadingLoginGoogle = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  String? TextError(String? Text) {
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
      _isLoadingLoginEmail = true;
    });
    String? res = await AuthMethods().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
    setState(() {
      _isLoadingLoginEmail = false;
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
      child: Padding(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldInput(
              textEditingController: _emailController,
              hintText: 'Email',
              errorText: TextError(_errorText),
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),
            TextFieldInput(
              textEditingController: _passwordController,
              hintText: 'Senha',
              errorText: TextError(_errorText),
              textInputType: TextInputType.visiblePassword,
              isPass: true,
            ),
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Esqueceu a senha?",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Appthemes.primary,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButtonWidget(
              onPressed: loginUser,
              child: _isLoadingLoginEmail
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Appthemes.background,
                      ),
                    )
                  : Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Appthemes.background,
                        ),
                      ),
                    ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: Text(
                  "ou",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButtonWidget(
              onPressed: () {},
              color: Appthemes.blueColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _isLoadingLoginFaceBook

                    ? Center(
                        child: CircularProgressIndicator(
                          color: Appthemes.background,
                        ),
                      )
                    : Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.facebook,
                            size: 30,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Login com o Facebook",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                      color: Appthemes.background,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButtonWidget(
              onPressed: () {},
              bottom: 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _isLoadingLoginGoogle
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Appthemes.background,
                        ),
                      )
                    : Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.google,
                            size: 30,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Login com o Google",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                      color: Appthemes.background,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
