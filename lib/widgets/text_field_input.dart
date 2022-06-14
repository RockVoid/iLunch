import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilunch/themes/app_themes.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String hintText;
  final String? errorText;
  final bool isPass;

  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    this.errorText,
    required this.textInputType,
    this.isPass = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        keyboardType: textInputType,
        obscureText: isPass,
        controller: textEditingController,
        decoration: InputDecoration(
          errorText: errorText,
          errorStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Appthemes.primary,
              fontSize: 10,
            ),
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Appthemes.greySubtitle,
            ),
          ),
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          errorBorder: inputBorder,
          disabledBorder: inputBorder,
          focusedErrorBorder: inputBorder,
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        ),
      ),
    );
  }
}
