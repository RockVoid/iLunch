import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilunch/themes/app_themes.dart';

class StatusVendedor extends StatefulWidget {
  const StatusVendedor({Key? key}) : super(key: key);

  @override
  State<StatusVendedor> createState() => _StatusVendedorState();
}

class _StatusVendedorState extends State<StatusVendedor> {
  List<String> items = ['Offline', 'Ausente', 'Vendendo'];
  String? selectedItem = 'Offline';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        label: Text('Status de Venda', style: GoogleFonts.poppins(
          color: Appthemes.background,
        ),),
        contentPadding: EdgeInsets.only(left: 10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: Appthemes.background,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: Appthemes.background,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: Appthemes.background,
          ),
        ),
      ),
      value: selectedItem,
      onChanged: (op) => setState(() {
        selectedItem = op;
      }),
      items: items
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyle(color: Appthemes.primary),
              ),
            ),
          )
          .toList(),
      iconEnabledColor: Appthemes.background,
      isExpanded: true,
    );
  }
}
