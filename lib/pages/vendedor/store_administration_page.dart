import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilunch/pages/vendedor/product_vendedor_page.dart';
import 'package:ilunch/themes/app_themes.dart';
import 'package:ilunch/widgets/menu_buttons.dart';
import 'package:ilunch/widgets/product_tile.dart';
import 'package:ilunch/widgets/status_vendedor.dart';
import '../../widgets/show_snack_bar.dart';

class StoreAdministrationPage extends StatefulWidget {
  final String uid;

  const StoreAdministrationPage({Key? key, required this.uid})
      : super(key: key);

  @override
  State<StoreAdministrationPage> createState() =>
      _StoreAdministrationPageState();
}

class _StoreAdministrationPageState extends State<StoreAdministrationPage> {
  Map<String, dynamic> userData = {};
  bool isLoading = false;
  bool hasImage = false;

  getDataBuyer() async {
    setState(() {
      isLoading = true;
    });
    try {
      DocumentSnapshot<Map<String, dynamic>> userSnap = await FirebaseFirestore
          .instance
          .collection('buyerUser')
          .doc(widget.uid)
          .get();

      userData = userSnap.data()!;
      if (userData['image'] == null || userData['image'] == 'null') {
        setState(() {
          hasImage = false;
        });
      } else {
        setState(() {
          hasImage = true;
        });
      }
      setState(() {});
    } catch (e) {
      ShowSnackBar(e.toString(), context);
    }
    setState(() {
      isLoading = false;
    });
  }

  String numberExist() {
    String number;
    if (userData['number'] == 'null' || userData['number'] == null) {
      number = 'Adicione um número';
    } else {
      number = userData['number'];
    }
    return number;
  }

  String whereToBuyExist() {
    String place;
    if (userData['whereToBuy'] == 'null' || userData['whereToBuy'] == null) {
      place = 'Adicione um local para comprar';
    } else {
      place = userData['whereToBuy'];
    }
    return place;
  }

  ImageProvider<Object> hasBackgroundImageFirebase() {
    ImageProvider<Object> image;
    if (hasImage) {
      image = NetworkImage(userData['backgroundimage']);
    } else {
      image = AssetImage('assets/images/person_icon.png');
    }
    return image;
  }

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
                        offset: Offset(0, 3),
                      ),
                    ],
                    image: DecorationImage(
                      image: hasBackgroundImageFirebase(),
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
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 21, right: 21, top: 0, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: hasImage
                                    ? Image.network(
                                        userData['image'],
                                        height: 80,
                                        width: 80,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        'assets/images/person_icon.png',
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
                          SizedBox(height: 35,),
                          StatusVendedor(),
                        ],
                      ),
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
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => ProductVendedorPage()));
                      },
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
