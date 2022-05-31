import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilunch/model/pedido_model.dart';
import 'package:ilunch/themes/app_themes.dart';
import 'package:ilunch/widgets/product_tile.dart';


class HistoricPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 100,
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left_outlined,
              size: 28,
              color: Appthemes.primary,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          titleSpacing: 0,
          title: Text(
            'Histórico de Pedidos',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
        body:
            StreamBuilder<List<PedidoModel>>(
          stream: readPedidos(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Aconteceu algum erro!!  ${snapshot}');
            } else if (snapshot.hasData) {
              final pedidos = snapshot.data!;
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 21),
                children: pedidos
                    .map(
                      (PedidoModel pedido) => 
                      ProductTile(
                        title: pedido.title,
                        description: pedido.description,
                        value: pedido.price,
                        unity: pedido.unity,
                        linkImage: pedido.linkImage,
                        onTap: () {},
                      ),
                    )
                    .toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      );
}
