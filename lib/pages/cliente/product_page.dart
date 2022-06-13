import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilunch/pages/cliente/store_page.dart';
import 'package:ilunch/themes/app_themes.dart';

class ProductPage extends StatefulWidget {
  final ProductModelFake product;
  const ProductPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  static int count = 1;

  void decrement() {
    setState(() {
      if (count > 1) count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.bottom,
      duration: const Duration(milliseconds: 200),
      child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 80),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              widget.product.linkImage),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 12),
                        child:
                            InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Color(0xFFFF0000),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Appthemes.background,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    children: [
                      ListTile(
                        minVerticalPadding: 20,
                        contentPadding: EdgeInsets.all(0),
                        isThreeLine: true,
                        title: Text(
                          widget.product.title,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text.rich(
                          TextSpan(
                            text: 'Serve até ${widget.product.servePeople} pessoa(s)\n',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              height: 2,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    '${widget.product.description}\n',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Appthemes.greySubtitle,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: 'R\$ ${widget.product.price}',
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
                        height: 70,
                      ),
                      Container(
                        // height: MediaQuery.of(context).size.height * 0.14,
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        decoration: BoxDecoration(
                          // color: Colors.green,
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: Row(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.food_bank_outlined,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                      Flexible(
                                        flex: 4,
                                        child: Text(
                                          widget.product.vendedor.username,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Icon(
                                          Icons.verified,
                                          color: Appthemes.primary,
                                          size: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      widget.product.vendedor.stars,
                                      style: GoogleFonts.poppins(
                                        color: Appthemes.avaliationColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Appthemes.avaliationColor,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              widget.product.vendedor.whereToBuy,
                              style: GoogleFonts.poppins(
                                  color: Appthemes.greySubtitle),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon:
                                    const Icon(FontAwesomeIcons.minus, size: 18),
                                color: const Color(0xFFFF0000),
                                onPressed: decrement,
                              ),
                              Text(
                                '$count',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(FontAwesomeIcons.plus, size: 18),
                                color: const Color(0xFFFF0000),
                                onPressed: increment,
                              ),
                              Text(
                                'R\$ ${(widget.product.price * count).toStringAsFixed(2)}',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Comprar'),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              primary: Appthemes.primary,
                              elevation: 12,
                              fixedSize: Size.fromWidth(100),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
