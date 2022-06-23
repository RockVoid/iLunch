import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilunch/pages/gerais/auth_page.dart';
import 'package:ilunch/pages/gerais/edit_page.dart';
import 'package:ilunch/pages/gerais/feedback_page.dart';
import 'package:ilunch/pages/gerais/help.dart';
import 'package:ilunch/pages/gerais/historic_page.dart';
import 'package:ilunch/pages/gerais/notifications_page.dart';
import 'package:ilunch/pages/gerais/saves.dart';
import 'package:ilunch/pages/gerais/switch_buyer_page.dart';
import 'package:ilunch/services/auth_methods.dart';
import 'package:ilunch/themes/app_themes.dart';
import 'package:ilunch/widgets/show_snack_bar.dart';

class ProfilePage extends StatefulWidget {
  final String uid;
  final bool isBuyer;

  const ProfilePage(this.isBuyer, {Key? key, required this.uid})
      : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic> userData = {};
  bool isLoading = false;
  bool hasImage = false;
  String collection = "";

  String isBuyerOrNot(bool isBuyer) {
    if (isBuyer == true) {
      return 'BuyerUsers';
    } else {
      return 'Users';
    }
  }

  void signOut() async {
    await AuthMethods().signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => AuthPage(),
      ),
    );
    ShowSnackBar('Usuário desconectado', context);
  }
  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      DocumentSnapshot<Map<String, dynamic>> userSnap = await FirebaseFirestore
          .instance
          .collection(collection)
          .doc(widget.uid)
          .get();

      userData = userSnap.data()!;
      if (userData['image'] == 'null') {
        setState(() {
          hasImage = false;
        });
      } else {
        setState(() {
          hasImage = true;
        });
      }
      setState(() {});
    } catch (e) {
      ShowSnackBar(e.toString(), context);
    }
    setState(() {
      isLoading = false;
    });
  }

  String numberExist() {
    String number;
    if (userData['number'] == 'null' || userData['number'] == null) {
      number = 'Adicione um número';
    } else {
      number = userData['number'];
    }
    return number;
  }

  String whereToBuyExist() {
    String place;
    if (userData['whereToBuy'] == 'null' || userData['whereToBuy'] == null) {
      place = 'Adicione um local para comprar';
    } else {
      place = userData['whereToBuy'];
    }
    return place;
  }

  String imageExist() {
    String image;
    if (userData['image'] == 'null' || userData['image'] == null) {
      image = 'Adicione um local para comprar';
    } else {
      image = userData['image'];
    }
    return image;
  }

  @override
  void initState() {
    super.initState();
    collection = isBuyerOrNot(widget.isBuyer);
    getData();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(245, 250, 250, 250),
          titleSpacing: 14,
          title: Text(
            "Detalhes Pessoais",
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => EditPage()));
              },
              icon: Icon(Icons.settings),
              color: Colors.black,
            )
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        isLoading
                            ? CircularProgressIndicator(
                                color: Appthemes.blackColor,
                              )
                            : Container(
                                alignment: AlignmentDirectional.center,
                                width: 200.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: hasImage
                                        ? Image.network(
                                            userData['image'],
                                            height: 150,
                                          )
                                        : Image.asset(
                                            'assets/images/person_icon.png',
                                            height: 150,
                                          ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 16,
                        ),
                        isLoading
                            ? CircularProgressIndicator(
                                color: Appthemes.blackColor,
                              )
                            : Text(
                                userData['username'],
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 21),
                                ),
                              ),
                        isLoading
                            ? CircularProgressIndicator(
                                color: Appthemes.blackColor,
                              )
                            : Text(
                                userData['email'],
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 11),
                                ),
                              ),
                        isLoading
                            ? CircularProgressIndicator(
                                color: Appthemes.blackColor,
                              )
                            : Text(
                                whereToBuyExist(),
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 12),
                                ),
                              ),
                        isLoading
                            ? CircularProgressIndicator(
                                color: Appthemes.blackColor,
                              )
                            : Text(
                                numberExist(),
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 12),
                                ),
                              ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        icon: Icon(
                          Icons.tab,
                          color: Colors.grey[800],
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Saves()));
                        },
                        label: Text(
                          "Salvos",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(color: Colors.grey[800])),
                        ),
                        style: TextButton.styleFrom(
                            elevation: 0.8, backgroundColor: Colors.white),
                      ),
                      TextButton.icon(
                        icon: Icon(
                          Icons.notification_important_outlined,
                          color: Colors.grey[800],
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NotificationsPage()));
                        },
                        label: Text(
                          "Notificações",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(color: Colors.grey[800])),
                        ),
                        style: TextButton.styleFrom(
                            elevation: 0.8, backgroundColor: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HistoricPage()));
                          },
                          style: OutlinedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.black,
                            elevation: 1,
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              vertical: 13,
                              horizontal: 22,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Histórico de Pedidos",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Help(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.black,
                            elevation: 1,
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                vertical: 13, horizontal: 22),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Ajuda",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FeedbackPage()));
                    },
                    child: Text(
                      'Enviar um Feedback',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SwitchBuyerPage(userData: userData),
                        ),
                      );
                    },
                    child: Text(
                      'Tornar-se Parceiro',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Avalie-nos',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  InkWell(
                    onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Deseja realmente sair?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Não'),
                            child: const Text('Não'),
                          ),
                          TextButton(
                            onPressed: () => signOut(),
                            child: const Text('Sim'),
                          ),
                        ],
                      ),
                    ),
                    child: Text(
                      'Sair',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Appthemes.primary,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
