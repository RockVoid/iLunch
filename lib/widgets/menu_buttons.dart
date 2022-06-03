import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilunch/pages/gerais/profile_page.dart';
import 'package:ilunch/pages/vendedor/summaryStats_page.dart';
import 'package:ilunch/themes/app_themes.dart';

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuButtons extends StatelessWidget {
  MenuButtons({Key? key}) : super(key: key);

  final List<MenuItem> dataMenu = [
    MenuItem(text: 'Pedidos', icon: Icons.store_sharp),
    MenuItem(text: 'Novo Produto', icon: Icons.new_label),
    MenuItem(text: 'Estatísticas', icon: Icons.auto_graph_sharp),
    MenuItem(text: 'Configurações', icon: Icons.settings),
  ];

  void onSelected(BuildContext context, MenuItem item) {
    switch (item.text) {
      case 'Configurações':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ProfilePage(true, uid: FirebaseAuth.instance.currentUser!.uid)));
        break;
      case 'Pedidos':
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
        break;
      case 'Novo Produto':
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
        break;
      case 'Estatísticas':
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResumoEstatisticasPage()));
        break;
      default: break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuItem>(
      icon: Container(
        height: 100,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          Icons.manage_accounts,
          color: Appthemes.primary,
          size: 22,
        ),
      ),
      onSelected: (item) => onSelected(context, item),
      itemBuilder: (context) => [
        ...dataMenu.map(
          ((item) => PopupMenuItem(
                value: item,
                child: Row(
                  children: [
                    Icon(
                      item.icon,
                      color: Appthemes.primary,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      item.text,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Appthemes.primary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              )),
        )
      ],
    );
  }
}
