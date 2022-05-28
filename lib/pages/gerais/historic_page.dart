import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilunch/themes/app_themes.dart';
import 'package:ilunch/widgets/product_tile.dart';

class Product {
  final String title;
  final String description;
  final double value;
  final int unity;
  final String linkImage;

  Product(
      {required this.title,
      required this.description,
      required this.value,
      required this.unity,
      required this.linkImage});
}

class HistoricPage extends StatelessWidget {
  final List<Product> produtosList = [
    Product(
      title: 'trufa de ninho',
      description:
          'Uma trufa de cacau com recheio de ninho. Bastante deliciosa e feita com muito amor e carinho.',
      value: 1.99,
      unity: 1,
      linkImage:
          'https://www.receitascomida.com.br/wp-content/uploads/2018/08/trufas-de-leite-em-po_2263-610x300.jpg',
    ),
    Product(
      title: 'Cachorro quente',
      description:
          'Cachorro quente caseiro, que leva em sua composição salsicha, molho, batata palha, milho e salsicha.',
      value: 2.99,
      unity: 1,
      linkImage:
          'https://www.montarumnegocio.com/wp-content/uploads/2018/02/Receita-de-cachorro-quente-para-vender-e-ganhar-dinheiro.jpg',
    ),
    Product(
      title: 'Coxinha',
      description: 'Uma tradicional coxinha sabor frango. Bastante deliciosa que foi feita com pimenta.',
      value: 2.50,
      unity: 1,
      linkImage:
          'http://www.dulcerestaurantecolonial.com.br/wp-content/uploads/2019/10/Coxinha-de-frango-A-verdade-sobre-a-origem-do-salgado-que-%C3%A9-paix%C3%A3o-nacional-Dulce-Caf%C3%A9-Colonial.jpg',
    ),
  ];

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                for (var produto in produtosList)
                  Column(
                    children: [
                      ProductTile(
                        title: produto.title,
                        description: produto.description,
                        value: produto.value,
                        unity: produto.unity,
                        linkImage: produto.linkImage,
                        onTap: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Divider(
                          height: 2,
                          thickness: 0.5,
                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),
        ),
      );
}
