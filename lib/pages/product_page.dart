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
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.network(
                    'https://static-images.ifood.com.br/image/upload/t_medium/pratos/67b715be-fd94-4d46-9285-78f643700591/202003251115_ygzT_.jpeg',
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
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
                                  'CAMARÃO ESPECIAL DON TALLENTO',
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.9, -0.49),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    'Serve até 2 pessoas',
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 345,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0x00EEEEEE),
                                ),
                                child: Text(
                                    '\nEnvolvido com arroz cremoso ao molho branco e gratinado com queijo mussarela.\n\n',
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'R\$ 120,90',
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(6, 0, 20, 0),
              child: Align(
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
                      'R\$ 120,90',
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
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(16.0),
                                primary: Colors.white,
                                textStyle: GoogleFonts.poppins(
                                  fontSize: 16,
                                ),
                              ),
                              onPressed: () {},
                              child: const Text('Adicionar'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
    );
  }
}
