import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'detailsSell_vendedor_page.dart';

class SeeAllStats extends StatefulWidget {
  const SeeAllStats({Key? key}) : super(key: key);

  @override
  State<SeeAllStats> createState() => _SeeAllStatsState();
}

class _SeeAllStatsState extends State<SeeAllStats> {
  List<String> pedidos = [
    'Pedido 10',
    'Pedido 9',
    'Pedido 8',
    'Pedido 7',
    'Pedido 6',
    'Pedido 5',
    'Pedido 4',
    'Pedido 3',
  ];
  int num = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(22),
            child: ListView(
              children: [
                Row(children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.keyboard_arrow_left_outlined),
                    color: Colors.red,
                  ),
                  Text(
                    "Atividades",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ]),
                SizedBox(
                  height: 30,
                ),
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(children: [
                          for (String pedido in pedidos)
                            ListTile(
                              title: Text(
                                pedido,
                                style: GoogleFonts.poppins(),
                              ),
                              subtitle: Text('12/12/2022'),
                              trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("R\$ 20,00"),
                                    SizedBox(width: 8),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailsSell()));
                                      },
                                      child: Text(
                                        "Detalhes",
                                        style: GoogleFonts.poppins(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                        ])),
                  ),
                ),
              ],
            )));
  }
}
