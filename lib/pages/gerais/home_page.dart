import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilunch/model/buyer_user_model.dart';
import 'package:ilunch/pages/cliente/store_page.dart';
import 'package:ilunch/themes/app_themes.dart';
import 'package:ilunch/widgets/home_item_vendedor.dart';
import 'package:ilunch/widgets/home_search_bar.dart';

class Category {
  final String image;
  final String name;

  Category({required this.name, required this.image});
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Category> categoryList = [
    Category(
        name: 'Salgados',
        image:
            "https://melepimenta.com/wp-content/uploads/2021/06/Salgado-assado-enroladinho-Baixa-17.jpg"),
    Category(
        name: 'Doces',
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiMmjyQO8kLSJfnpT3B1b3zzBdOxcRgIBSBA&usqp=CAU"),
    Category(
        name: 'Saudável',
        image:
            "https://www.assai.com.br/sites/default/files/styles/blog_destaque/public/blog/alimentacao_saudavel.jpg?itok=5q11a-Q-"),
    Category(
        name: 'Almoço',
        image:
            "https://remidos.com.br/wp-content/uploads/2021/02/0640_x_0393_20200326171813_1A8D3.jpg"),
    Category(
        name: 'Bebidas',
        image:
            "https://catracalivre.com.br/wp-content/uploads/2018/02/cafe_kimrawicz.jpg"),
  ];

  final List<String> banners = [
    "https://static-images.ifood.com.br/image/upload/t_high,q_100/webapp/landing/landing-banner-1.png",
    "https://static-images.ifood.com.br/image/upload/t_high,q_100/webapp/landing/landing-banner-2.png",
    "https://static-images.ifood.com.br/image/upload/t_high,q_100/webapp/landing/landing-banner-3.png",
    "https://files.tecnoblog.net/wp-content/uploads/2022/03/burger-king-aplicativo-app-celular-700x394.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        StreamBuilder<List<BuyerUserModel>>(
          stream: readBuyerUser(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Aconteceu algum erro!! ${snapshot}'));
            } else if (snapshot.hasData) {
              List<BuyerUserModel> vendedores = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 22),
                        child: Center(
                          child: Text(
                            'iLunch',
                            style: GoogleFonts.ultra(
                              fontSize: 32,
                              color: Appthemes.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    HomeSearchBar(),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Column(
                        children: [
                          CarouselSlider(
                            //Categorias
                            options: CarouselOptions(
                                height: 120,
                                disableCenter: true,
                                viewportFraction: 0.29,
                                enableInfiniteScroll: false,
                                padEnds: false),
                            items: categoryList
                                .map((e) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Column(
                                          children: [
                                            Image.network(
                                              e.image,
                                              height: 60,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Center(
                                              child: Text(
                                                e.name,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                          CarouselSlider(
                            //Banners
                            options: CarouselOptions(
                                height: 150,
                                disableCenter: true,
                                viewportFraction: 0.9,
                                enableInfiniteScroll: false,
                                padEnds: false),
                            items: banners
                                .map((e) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 11),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          e,
                                          height: 70,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Vendedores',
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          for (BuyerUserModel vendedor in vendedores)
                            HomeItemVendedor(
                              vendedor: vendedor,
                              onTap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => StorePage(vendedor: vendedor,)));
                                
                              },
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } 
            else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ) 
        // : Text('oi')
    );
  }
}
