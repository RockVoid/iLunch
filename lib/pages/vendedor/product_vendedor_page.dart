import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilunch/themes/app_themes.dart';

class ProductVendedorPage extends StatelessWidget {
  const ProductVendedorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.bottom,
      duration: const Duration(milliseconds: 200),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://www.receitascomida.com.br/wp-content/uploads/2018/08/trufas-de-leite-em-po_2263-610x300.jpg'),
                      fit: BoxFit.fill,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  height: MediaQuery.of(context).size.height * 0.33,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.33,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.25),
                        Colors.black.withOpacity(0.25),
                      ],
                      stops: [0.0, 0.5],
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                    child: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Appthemes.primary,
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              minVerticalPadding: 20,
              contentPadding: EdgeInsets.symmetric(horizontal: 22),
              isThreeLine: true,
              title: Text(
                'Trufa de Ninho com Nutela',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              subtitle: Text.rich(
                TextSpan(
                  text: 'Serve até 1 pessoa(s)\n',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    height: 2,
                  ),
                  children: [
                    TextSpan(
                      text:
                          'Uma tradicional coxinha sabor frango. Bastante deliciosa que foi feita com pimenta.\n',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Appthemes.greySubtitle,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'R\$ 1,99',
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        height: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.edit),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Editar Produto'),
                ],
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                primary: Appthemes.primary,
                elevation: 12,
                fixedSize: Size(300, 45),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.delete),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Excluir Produto'),
                ],
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                primary: Appthemes.primary,
                elevation: 12,
                fixedSize: Size(300, 45),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
