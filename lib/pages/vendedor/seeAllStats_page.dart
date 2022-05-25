import 'package:flutter/material.dart';

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
                    style: TextStyle(
                      fontSize: 35,
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
                              title: Text(pedido),
                              subtitle: Text('12/12/2022'),
                              trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("R\$ 20,00"),
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
              ],
            )));
  }
}
