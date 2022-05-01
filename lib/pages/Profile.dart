import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
            TextButton(
              style: TextButton.styleFrom(
                alignment: Alignment(0, 0.12),
                textStyle: const TextStyle(fontSize: 15),
              ),
              onPressed: null,
              child: const Text(
                "Editar",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
        body: Center(
            child: Padding(
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
                  onPressed: null,
                  label: Text("Salvos"),
                  style: TextButton.styleFrom(elevation: 0.8),
                ),
                TextButton.icon(
                  icon: Icon(Icons.notification_important_outlined),
                  onPressed: null,
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
                  onPressed: () {},
                  icon: Text(
                    "Historico de Pedidos",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  label: Icon(
                    Icons.add,
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
                  onPressed: () {},
                  label: Icon(Icons.add, size: 18),
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
                        ..onTap = () => print('click'),
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
                        ..onTap = () => print('click'),
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
                        ..onTap = () => print('click'),
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
                      text: ' Sair',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => print('click'),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 6,
            ),
          ]),
        )),
      );
}
