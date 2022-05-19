import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilunch/themes/app_themes.dart';

class ProductTile extends StatelessWidget {
  final String title;
  final String description;
  final double value;
  final int unity;
  final String linkImage;
  const ProductTile({Key? key, required this.title, required this.description, required this.value, required this.unity, required this.linkImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
        flex: 2,
        child: ListTile(
          minVerticalPadding: 0,
          contentPadding: EdgeInsets.only(right: 7, left: 0),
          title: Text.rich(
            TextSpan(
              text: '$title\n',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text:
                      '$description',
                  style: GoogleFonts.poppins(
                    color: Appthemes.greySubtitle,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'R\$ $value   |   $unity unidade',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          margin: EdgeInsets.only(top: 6),
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(
                '$linkImage'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    ]);
  }
}
