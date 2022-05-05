import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Category {
  final String image;
  final String name;
  Category({required this.name, required this.image});
}

class Vendedores {
  final String name;
  final String stars;
  final String category;
  final String image;
  Vendedores({
    required this.name,
    required this.stars,
    required this.category,
    required this.image,
  });
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

  final List<Vendedores> vendedores = [
    Vendedores(
      name: 'Alice Braga',
      stars: '4,5',
      category: 'Doces',
      image:
          'https://istoe.com.br/wp-content/uploads/sites/14/2022/03/ana-maria-braga-2-418x235.jpg',
    ),
    Vendedores(
      name: 'Gil da Esfirra',
      stars: '5,0',
      category: 'Salgados',
      image:
          'https://conteudo.imguol.com.br/blogs/255/files/2019/06/875-1024x576.png',
    ),
    Vendedores(
      name: 'Divina Picanha',
      stars: '4,8',
      category: 'Almoço',
      image:
          'https://static-images.ifood.com.br/image/upload/t_high/logosgde/67b715be-fd94-4d46-9285-78f643700591/202004281811_QSGV_.jpeg',
    ),
    Vendedores(
      name: 'Divina Sopas',
      stars: '4,5',
      category: 'Almoço',
      image:
          'https://static-images.ifood.com.br/image/upload/t_high/logosgde/4d81fc37-846f-4cea-86c6-4baeb30d9930/202203170928_Rxst_.jpeg',
    ),
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
      body: SingleChildScrollView(
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
                      color: Color(0xFFFFEA1D2C),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xFFE3E3E6),
                ),
                child: TextField(
                  cursorColor: Color(0xFFFFEA1D2C),
                  decoration: InputDecoration(
                    hintText: "Item ou loja",
                    border: InputBorder.none,
                    icon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Icon(
                            Icons.search,
                            color: Color(0xFFFFEA1D2C),
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 48,
                          color: Color(0xFFFFEA1D2C),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Column(
                children: [
                  CarouselSlider(
                    //Categorias
                    options: CarouselOptions(
                        height: 130,
                        disableCenter: true,
                        viewportFraction: 0.29,
                        enableInfiniteScroll: false,
                        padEnds: false),
                    items: categoryList
                        .map((e) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
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
                                        style:
                                            GoogleFonts.poppins(fontSize: 12),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 11),
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
                  for (Vendedores vendedor in vendedores)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 22),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  vendedor.image,
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        vendedor.name,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.verified,
                                        color: Color(0xFFFFEA1D2C),
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        vendedor.stars,
                                        style: GoogleFonts.poppins(),
                                      ),
                                      Icon(
                                        Icons.star_rate_rounded,
                                        color: Color(0xFFFFF9B405),
                                      ),
                                      Text('• ${vendedor.category}')
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border,
                              color: Color(0xFFFFEA1D2C),
                            ),
                          )
                        ],
                      ),
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
