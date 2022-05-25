import 'package:ilunch/pages/vendedor/seeAllStats_page.dart';
import 'package:flutter/material.dart';

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
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Aqui está seu desempenho",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
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
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Últimas Atividades',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w700),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SeeAllStats()));
                                },
                                child: Text(
                                  "Ver tudo",
                                  style: TextStyle(color: Colors.red),
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
                                children: const [
                                  Text('RS 20,00'),
                                  SizedBox(width: 8),
                                  Text(
                                    'Detalhes',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.red),
                                  ),
                                ]),
                          ),
                          ListTile(
                            title: Text('Pedido x'),
                            subtitle: Text('12/12/2022'),
                            trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text('RS 20,00'),
                                  SizedBox(width: 8),
                                  Text(
                                    'Detalhes',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.red),
                                  ),
                                ]),
                          ),

                          ListTile(
                            title: Text('Pedido x'),
                            subtitle: Text('12/12/2022'),
                            trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text('RS 20,00'),
                                  SizedBox(width: 8),
                                  Text(
                                    'Detalhes',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.red),
                                  ),
                                ]),
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
                          Row(children: const [
                            Text(
                              'Últimos 7 dias',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w700),
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
                                children: const [
                                  Text(
                                    'Vendas',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '10',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: const [
                                  Text(
                                    'Lucro',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'R\$ 100,00',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: const [
                                  Text(
                                    'Média diária',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'R\$ 100,00',
                                    style: TextStyle(
                                      fontSize: 20,
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
                          Row(children: const [
                            Text(
                              'Últimos 14 dias',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w700),
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
                                children: const [
                                  Text(
                                    'Vendas',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '10',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: const [
                                  Text(
                                    'Lucro',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'R\$ 100,00',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: const [
                                  Text(
                                    'Média diária',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'R\$ 100,00',
                                    style: TextStyle(
                                      fontSize: 20,
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
            )));
  }
}
