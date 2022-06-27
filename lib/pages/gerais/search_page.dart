import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_themes.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //Lista de comidas
  static List<FoodModel> main_food_list = [
    FoodModel("Pastel", 6, 4.2,
        "https://img.cybercook.com.br/receitas/6/pastel-na-airfryer-840x480.jpeg?q=75"),
    FoodModel("Coxinha", 3, 4.8,
        "https://www.revistabula.com/wp/wp-content/uploads/2019/06/coxinha-610x350.jpg.webp"),
    FoodModel("Hamburguer", 12, 4.5,
        "https://revistamenu.com.br/wp-content/uploads/2020/08/rappiburger.jpg"),
    FoodModel("Pão de Queijo", 2, 3.8,
        "https://static.clubedaanamariabraga.com.br/wp-content/uploads/2021/03/pao-de-queijo-da-ana-maria-1024x576.jpg"),
    FoodModel("Sanduíche", 7, 4.9,
        "https://www.istoedinheiro.com.br/wp-content/uploads/sites/17/2019/02/mcnifico-768x432.png"),
    FoodModel("Açai", 10, 4.9,
        "https://content.portaldofranchising.com.br/wp-content/uploads/2018/04/17180153/franquias-de-acai-1.jpg"),
    FoodModel("Cachorro-quente", 5, 2.1,
        "http://jornalperiscopio.com.br/site/wp-content/uploads/2018/02/hot-dog.jpg"),
    FoodModel("Empada", 8, 3.1,
        "https://sundaycooks.com/wp-content/uploads/2020/04/comidas-tipicas-da-argentina-12-800x450.jpg.webp"),
    FoodModel("Pizza", 17, 4.4,
        "https://images.aws.nestle.recipes/resized/6fb35c719aeddbb8d8e6713f2ec979cd_pizza-frango-catupiry-receitas-nestle_1200_600.jpg"),
    FoodModel("Brigadeiro", 1, 4.2,
        "https://images.aws.nestle.recipes/resized/3eb2579cdb04726a58431318ac293569_brigadeiro-receitas-nestle_1200_600.jpg"),
    FoodModel("Feijoada", 10, 4.3,
        "https://www.melhoresdestinos.com.br/wp-content/uploads/2020/12/comidas-tipicas-capa2019-01.jpg"),
  ];

  List<FoodModel> display_list = List.from(main_food_list);

  void updateList(String value) {
    //Filtro da lista
    setState(() {
      display_list = main_food_list
          .where((element) =>
              element.comida_nome!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Procure por sua refeição",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      
                    ),
                  )),
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Appthemes.stroke,
                ),
                child: TextField(
                  autofocus: true,
                  onChanged: (value) => updateList(value),
                  cursorColor: Appthemes.primary,
                  decoration: InputDecoration(
                    hintText: "Ex: Brigadeiro",
                    border: InputBorder.none,
                    icon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Icon(
                            Icons.search,
                            color: Appthemes.primary,
                          ),
                        ),
                        Center(
                          child: Container(
                            width: 1,
                            height: 35,
                            color: Appthemes.primary,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: display_list.length,
                  itemBuilder: (context, index) => TextButton(
                    onPressed: () {},
                    child: ListTile(
                      contentPadding: EdgeInsets.all(8.0),
                      title: Text(display_list[index].comida_nome!,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: Text(
                        "RS ${display_list[index].comida_valor!}",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      trailing: Text("⭐ ${display_list[index].rating}"),
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            display_list[index].comida_foto_url!,
                            height: 150,
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodModel {
  String? comida_nome;
  int? comida_valor;
  String? comida_foto_url;
  double? rating;

  FoodModel(
      this.comida_nome, this.comida_valor, this.rating, this.comida_foto_url);
}
