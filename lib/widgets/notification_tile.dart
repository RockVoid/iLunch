import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationTile extends StatelessWidget {
  final notification;
  const NotificationTile({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 90,
              height: 60,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/iLunch.png'),
                ),
              ),
            ),
            Flexible(
              child: ListTile(
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  notification.description,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    notification.date,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Divider(
            height: 2,
            thickness: 0.5,
          ),
        )
      ],
    );
  }
}
