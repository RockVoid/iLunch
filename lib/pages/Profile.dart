import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ilunch/pages/Pages-Profile/Edit.dart';
import 'package:ilunch/pages/Pages-Profile/Evaluate.dart';
import 'package:ilunch/pages/Pages-Profile/Feedback.dart';
import 'package:ilunch/pages/Pages-Profile/Help.dart';
import 'package:ilunch/pages/Pages-Profile/Historic.dart';
import 'package:ilunch/pages/Pages-Profile/Notifications.dart';
import 'package:ilunch/pages/Pages-Profile/Report.dart';
import 'package:ilunch/pages/Pages-Profile/Saves.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          titleSpacing: 0.0,
          title: Transform(
            transform: Matrix4.translationValues(0.0, 0.0, 0.0),
            child: Text(
              "Detalhes Pessoais",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Edit()));
              },
              icon: Icon(Icons.settings),
              color: Colors.black,
            )
          ],
        ),
        body: ListView(children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(children: [
              Container(
                width: 200.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://imagens3.ne10.uol.com.br/blogsne10/social1/uploads/2019/11/Faust%C3%A3o-se-irrita-com-funcion%C3%A1rio-ao-vivo.jpg"),
                    radius: 60,
                  ),
                ),
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 2.0)),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Guilherme Alencar",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 24),
              ),
              Text(
                "guilhermealencar@gmail.com",
                style: TextStyle(color: Colors.grey.shade800, fontSize: 12),
              ),
              Text(
                "+91 xxxxxxxxxx",
                style: TextStyle(color: Colors.grey.shade800, fontSize: 12),
              ),
              Text(
                "Rua do Benfica, 777",
                style: TextStyle(color: Colors.grey.shade800, fontSize: 12),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton.icon(
                    icon: Icon(Icons.tab),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Saves()));
                    },
                    label: Text("Salvos"),
                    style: TextButton.styleFrom(elevation: 0.8),
                  ),
                  TextButton.icon(
                    icon: Icon(Icons.notification_important_outlined),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Notifications()));
                    },
                    label: Text("Notificações"),
                    style: TextButton.styleFrom(elevation: 0.8),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              ),
              SizedBox(
                  height: 60,
                  width: 300,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Historic()));
                    },
                    icon: Text(
                      "Historico de Pedidos",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    label: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 18,
                    ),
                    style: OutlinedButton.styleFrom(
                        primary: Colors.black, elevation: 1),
                  )),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                  height: 60,
                  width: 300,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Help()));
                    },
                    label: Icon(Icons.arrow_forward_ios_outlined, size: 18),
                    icon: Text(
                      "Ajuda",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20),
                    ),
                    style: OutlinedButton.styleFrom(
                        primary: Colors.black, elevation: 1),
                  )),
              SizedBox(
                height: 40,
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Enviar um Feedback',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Feedbacks()))
                              },
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16))
                  ],
                ),
              ),
              SizedBox(
                height: 17,
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Reportar Algo',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Report()))
                              },
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16))
                  ],
                ),
              ),
              SizedBox(
                height: 17,
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Avalie-nos',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Evaluate()))
                              },
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16))
                  ],
                ),
              ),
              SizedBox(
                height: 17,
              ),
              SizedBox(
                height: 6,
              ),
            ]),
          ),
        ]),
      );
}
