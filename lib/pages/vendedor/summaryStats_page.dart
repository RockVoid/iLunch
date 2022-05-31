import 'package:ilunch/pages/vendedor/detailsSell_vendedor_page.dart';
import 'package:ilunch/pages/vendedor/seeAllStats_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResumoEstatisticasPage extends StatelessWidget {
  const ResumoEstatisticasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.keyboard_arrow_left_outlined),
                  color: Colors.red,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Olá parceiro,",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Aqui está seu desempenho",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: 30,
            ),

            //ROW DO FATURAMENTO

            const SizedBox(height: 20),
            //ROW DO DESPESAS MENSAIS
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Últimas Atividades',
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SeeAllStats()));
                            },
                            child: Text(
                              "Ver tudo",
                              style: GoogleFonts.poppins(color: Colors.red),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),

                      //ROW LUCRO MENSAL
                      ListTile(
                        title: Text('Pedido x'),
                        subtitle: Text('12/12/2022'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('RS 20,00'),
                            SizedBox(width: 8),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailsSell()));
                              },
                              child: Text(
                                "Detalhes",
                                style: GoogleFonts.poppins(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Text('Pedido x'),
                        subtitle: Text('12/12/2022'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('RS 20,00'),
                            SizedBox(width: 8),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailsSell()));
                              },
                              child: Text(
                                "Detalhes",
                                style: GoogleFonts.poppins(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      ListTile(
                        title: Text('Pedido x'),
                        subtitle: Text('12/12/2022'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('RS 20,00'),
                            SizedBox(width: 8),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailsSell()));
                              },
                              child: Text(
                                "Detalhes",
                                style: GoogleFonts.poppins(
                                  color: Colors.red,
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
            ),
            SizedBox(
              height: 15,
            ),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: Column(children: [
                      Row(children: [
                        Text(
                          'Últimos 7 dias',
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        )
                      ]),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                'Vendas',
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '10',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                'Lucro',
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'R\$ 100,00',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                'Média diária',
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'R\$ 100,00',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ])),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: Column(children: [
                      Row(children: [
                        Text(
                          'Últimos 14 dias',
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        )
                      ]),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                'Vendas',
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '10',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                'Lucro',
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'R\$ 100,00',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                'Média diária',
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'R\$ 100,00',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
