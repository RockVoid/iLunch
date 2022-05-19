import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilunch/themes/app_themes.dart';
import 'package:ilunch/widgets/menu_buttons.dart';
import 'package:ilunch/widgets/product_tile.dart';

class StoreAdministrationPage extends StatelessWidget {
  const StoreAdministrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://diaonline.ig.com.br/wp-content/uploads/2019/01/doces-em-goiania-lugares-para-provar-verdadeiras-delicias-9.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
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
                    padding: const EdgeInsets.only(
                        left: 21, right: 21, top: 100, bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.network(
                            'https://jpimg.com.br/uploads/2021/04/design-sem-nome-2021-04-23t115550.668.jpg',
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          flex: 2,
                          child: ListTile(
                            minVerticalPadding: 0,
                            isThreeLine: true,
                            minLeadingWidth: 0,
                            contentPadding: EdgeInsets.all(0),
                            title: Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Alice Braga',
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                    // textAlign: TextAlign.end,
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  Icons.verified,
                                  color: Appthemes.primary,
                                  size: 18,
                                )
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '4,5',
                                      style: GoogleFonts.poppins(
                                          color: Appthemes.avaliationColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Appthemes.avaliationColor,
                                      size: 13,
                                    )
                                  ],
                                ),
                                Text(
                                  '+91 xxxxxxxxxxx',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  'alicebraga@gmail.com',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        MenuButtons(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 21,
                left: 21,
                top: 20,
              ),
              child: Column(
                children: [
                  ProductTile(
                      vendedorButtons: true,
                      onPressedDelete: () {},
                      onPressedEdit: () {},
                      title: 'Trufa de ninho',
                      description:
                          'Uma tradicional coxinha sabor frango. Bastante deliciosa que foi feita com pimenta.',
                      value: 1.99,
                      unity: 1,
                      linkImage:
                          'https://www.receitascomida.com.br/wp-content/uploads/2018/08/trufas-de-leite-em-po_2263-610x300.jpg'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      height: 2,
                      thickness: 0.5,
                    ),
                  ),
                  ProductTile(
                      vendedorButtons: true,
                      onPressedDelete: () {},
                      onPressedEdit: () {},
                      title: 'Brownie',
                      description:
                          'Um tradicional brownie de chocolate. Bastante delicioso.',
                      value: 2.99,
                      unity: 1,
                      linkImage:
                          'https://receitatodahora.com.br/wp-content/uploads/2015/09/brownie.jpg'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
