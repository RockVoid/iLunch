import 'package:flutter/material.dart';
import 'package:ilunch/themes/app_themes.dart';
import 'package:ilunch/widgets/notification_tile.dart';

class Notification {
  final String description;
  final String date;

  Notification({
    required this.description,
    required this.date,
  });
}

class NotificationsPage extends StatelessWidget {

  //Dados fake
  final List<Notification> notifications = [
    Notification(
        description:
            'Parabéns!! Você ganhou um cupom de R\$ 1,00 para gastar em qualquer compra.',
        date: '03/06/2022'),
    Notification(
        description:
            'Atenção!! Alice Braga está fazendo promoção de seus produtos.',
        date: '02/06/2022'),
    Notification(
        description:
            'Fome bateu? Peça um iLunch!!',
        date: '10/05/2022'),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Appthemes.background,
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          automaticallyImplyLeading: true,
          backgroundColor: Appthemes.background,
          titleSpacing: 0.0,
          title: Text(
            'Notificações',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left_outlined,
              size: 28,
              color: Appthemes.primary,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            child: Column(
              children: [
                for (Notification notification in notifications)
                  NotificationTile(notification: notification)
              ],
            )),
      );
}
