import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class productScreen extends StatefulWidget {
  const productScreen({Key? key}) : super(key: key);

  @override
  _productScreenState createState() => _productScreenState();
}

class _productScreenState extends State<productScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  void zerar() {
    setState(() {
      count == Null;
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 99;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      'assets/images/carne.jpg',
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-0.9, -0.56),
                                child: Text(
                                  'Carne na brasa',
                                  style: GoogleFonts.poppins(
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.9, -0.49),
                                child: Text(
                                  'Serve até 2 pessoas',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Container(
                                width: 345,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0x00EEEEEE),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0, -0.34),
                                  child: AutoSizeText(
                                      '\n400g de picanha importada em quatro fatias, queijo mussarela, regada ao molho roqueford, acompanha batatas noissetes e arroz com brócolis.\n\n',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins()),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'R\$ 19,99',
                                    style: GoogleFonts.poppins(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.9),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const Icon(FontAwesomeIcons.minus, size: 18),
                            color: const Color(0xFFFF0000),
                            onPressed: isEmpty ? null : decrement,
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
                            onPressed: isFull ? null : increment,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'R\$ 19,99',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Container(color: const Color(0xFFFF0000)),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
                              primary: Colors.white,
                              textStyle: GoogleFonts.poppins(
                                fontSize: 15,
                              ),
                            ),
                            onPressed: () {},
                            child: const Text('Adicionar'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.94, -0.98),
                child: InkWell(
                  onTap: () async {
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
                      color: Colors.black,
                      size: 36,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.07, 0.47),
                child: Container(
                  width: 345,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0x00EEEEEE),
                    border: Border.all(
                      color: Color(0xFF7C7C7C),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, -0.75),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.food_bank_outlined,
                              color: Colors.black,
                              size: 24,
                            ),
                            Text(
                              'Divina Picanha   ',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.check_circle_sharp,
                              color: Color(0xFFFF0000),
                              size: 16.5,
                            ),
                            Text(
                              '                                               4,5',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                              ),
                            ),
                            Icon(
                              Icons.star_rate,
                              color: Color(0xFFF9B405),
                              size: 19,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 1.03),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '  Escadaria Bloco Central - Terreo - IFCE',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
