import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
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
            )
          ]),
        )),
      );
}
