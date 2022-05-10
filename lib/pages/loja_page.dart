import 'package:flutter/material.dart';

import 'product_page.dart';

class CardItem {
  final String product;
  final String title;
  final String preco;

  const CardItem({
    required this.product,
    required this.title,
    required this.preco,
  });
}

class lojaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topRight,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (Image.asset('assets/images/divinapicanha.png',
                  height: 200, width: 380, fit: BoxFit.cover)),
              Align(
                alignment: AlignmentDirectional(0.1, 1),
                child: Row(children: [
                  Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: AlignmentDirectional(2, 0),
                            child: Text(
                              'Divina Picanha',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  height: 2,
                                  fontSize: 24),
                            )),
                        Text('categoria - distância',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                height: 1,
                                fontSize: 18,
                                color: Colors.black.withOpacity(0.6))),
                      ]),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.85, 0.05),
                      child: Container(
                        width: 50,
                        height: 65,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/divinapicanha.png',
                            ).image,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              Align(
                  alignment: AlignmentDirectional(-1, -1),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //icones de avaliação
                    children: const <Widget>[
                      Icon(
                        Icons.star_rate,
                        color: Color.fromARGB(255, 251, 255, 0),
                        size: 18.0,
                      ),
                      Icon(
                        Icons.star_rate,
                        color: Color.fromARGB(255, 255, 251, 0),
                        size: 18.0,
                      ),
                      Icon(
                        Icons.star_rate,
                        color: Color.fromARGB(255, 255, 251, 0),
                        size: 18.0,
                      ),
                      Icon(
                        Icons.star_rate,
                        color: Color.fromARGB(255, 255, 251, 0),
                        size: 18.0,
                      ),
                      Icon(
                        Icons.star_rate,
                        color: Color.fromARGB(255, 255, 251, 0),
                        size: 18.0,
                      ),
                    ],
                  )),

              //scroll dos produtos em ofertas ⬇
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Ofertas',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, height: 3, fontSize: 30),
                  )),
              SizedBox(
                  height: 200,
                  child: ListView.separated(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, _) => SizedBox(width: 8),
                      itemBuilder: (context, index) => Container(
                            height: 40,
                            width: 100,
                            padding: EdgeInsets.all(2),
                            child: AspectRatio(
                              aspectRatio: 3 / 2,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    productScreen()));
                                      },
                                      child: Center(
                                          child: Column(children: [
                                        Image.asset(
                                          'assets/images/carne.jpg',
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Descrição Produto',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Preço',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ))
                                      ])))),
                            ),
                          ))),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    //Scroll das promoções ⬇
                    'Promoções',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, height: -1, fontSize: 30),
                  )
                  ),
                  
              SizedBox(
                height: 200,
                child: ListView.separated(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, _) => SizedBox(width: 12),
                    itemBuilder: (context, index) => Container(
                        height: 40,
                        width: 100,
                        padding: EdgeInsets.all(3),
                        child: AspectRatio(
                          aspectRatio: 4 / 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Center(
                                child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    productScreen()));},
                                    child: Column(children: [
                                      Image.asset(
                                        'assets/images/pasta.jpg',
                                      ),
                                      const SizedBox(
                                        height: 0,
                                      ),
                                      Text(
                                        'Descrição Produto',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Preço',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ]))),
                          ),
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
