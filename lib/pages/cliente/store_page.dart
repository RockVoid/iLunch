import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilunch/model/buyer_user_model.dart';
import 'package:ilunch/pages/cliente/product_page.dart';
import 'package:ilunch/themes/app_themes.dart';
import 'package:ilunch/widgets/product_tile.dart';
import 'package:page_transition/page_transition.dart';

class ProductModelFake {
  final String title;
  final String description;
  final double price;
  final int unity;
  final int servePeople;
  final String linkImage;
  final BuyerUserModel vendedor;

  ProductModelFake({
    required this.title,
    required this.description,
    required this.price,
    required this.unity,
    required this.linkImage,
    required this.vendedor,
    required this.servePeople,
  });
}

class StorePage extends StatefulWidget {
  final BuyerUserModel vendedor;
  StorePage({Key? key, required this.vendedor}) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    const double percentOccupiedHeight = 0.15;
    const int durationTransitionPage = 350;

    List<ProductModelFake> vendedorProductList = [
      ProductModelFake(
        title: 'Cachorro Quente',
        description:
            'Um cachorro quente que leva em sua essencia o melhor para a sua degustação. São alguns dos ingredientes a batata palha, salsicha e molho de tomate.',
        price: 3.5,
        unity: 1,
        servePeople: 1,
        linkImage:
            'https://img.itdg.com.br/tdg/images/recipes/000/119/770/357545/357545_original.jpg?mode=crop&width=710&height=400',
        vendedor: widget.vendedor,
      ),
      ProductModelFake(
        title: 'Coxinha',
        description:
            'Uma tradicional coxinha sabor frango. Bastante deliciosa que foi feita com pimenta.',
        price: 2.5,
        unity: 1,
        servePeople: 1,
        linkImage:
            'http://www.dulcerestaurantecolonial.com.br/wp-content/uploads/2019/10/Coxinha-de-frango-A-verdade-sobre-a-origem-do-salgado-que-%C3%A9-paix%C3%A3o-nacional-Dulce-Caf%C3%A9-Colonial.jpg',
        vendedor: widget.vendedor,
      ),
      ProductModelFake(
        title: 'Esfirra de Carne ',
        description: 'Uma tradicional esfirra sabor carne. Bastante deliciosa.',
        price: 2.5,
        unity: 1,
        servePeople: 1,
        linkImage:
            'https://uploads.metropoles.com/wp-content/uploads/2020/05/28164724/esfirra-certa.jpg',
        vendedor: widget.vendedor,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height *
                      percentOccupiedHeight,
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
                      image: NetworkImage(widget.vendedor.backgroundImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height *
                      percentOccupiedHeight,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.2),
                      ],
                      stops: [0.0, 0.5],
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 21, vertical: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 20,
                                  color: Appthemes.primary,
                                )),
                          ),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border_rounded,
                                  size: 20,
                                  color: Appthemes.primary,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 20, 23, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: widget.vendedor.username,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  WidgetSpan(child: SizedBox(width: 2)),
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.verified,
                                      color: Appthemes.primary,
                                      size: 15,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\n${widget.vendedor.email}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\n${widget.vendedor.number}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ClipRRect(
                            child: Image.network(
                              widget.vendedor.image,
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.vendedor.stars,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 2),
                              for (int i = 0; i < 4; i++)
                                Icon(
                                  Icons.star_outlined,
                                  color: Appthemes.avaliationColor,
                                  size: 18,
                                ),
                            ],
                          ),
                          Text(
                            '15 avaliações',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Localização',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Appthemes.primary,
                          ),
                          SizedBox(width: 5),
                          Flexible(
                            child: Text(
                              widget.vendedor.whereToBuy,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 30),
                    child: Divider(
                      height: 0,
                      thickness: 0.4,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Em Destaque',
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // ),
                  SizedBox(height: 15),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 210,
                  disableCenter: true,
                  viewportFraction: 0.44,
                  enableInfiniteScroll: false,
                  padEnds: false,
                ),
                items: vendedorProductList
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                PageTransition(
                                  child: ProductPage(product: e),
                                  type: PageTransitionType.bottomToTop,
                                  duration: const Duration(
                                      milliseconds: durationTransitionPage),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Appthemes.stroke,
                                    width: 0.8,
                                  ),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.network(
                                          e.linkImage,
                                          height: 110,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 8, 0, 8),
                                        child: Text(
                                          e.title,
                                          style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                    child: Text(
                                      'R\$ ${e.price}',
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 35),
                  Text(
                    'Produtos do Vendedor',
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  for (ProductModelFake product in vendedorProductList)
                    ProductTile(
                      title: product.title,
                      description: product.description,
                      value: product.price,
                      unity: product.unity,
                      linkImage: product.linkImage,
                      onTap: () {
                        Navigator.of(context).push(
                          PageTransition(
                            child: ProductPage(product: product),
                            type: PageTransitionType.bottomToTop,
                            duration: const Duration(
                                milliseconds: durationTransitionPage),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
