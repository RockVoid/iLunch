import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilunch/model/buyer_user_model.dart';
import 'package:ilunch/themes/app_themes.dart';

class HomeItemVendedor extends StatelessWidget {
  final BuyerUserModel vendedor;
  final VoidCallback onTap;
  const HomeItemVendedor(
      {Key? key, required this.vendedor, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      vendedor.image,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Flexible(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${vendedor.username} ',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.verified,
                              color: Appthemes.primary,
                              size: 18,
                            ),
                          ),
                          TextSpan(
                            text: '\n${vendedor.stars}',
                            style: GoogleFonts.poppins(),
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.star_rate_rounded,
                              color: Color(0xFFFFF9B405),
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: Appthemes.primary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
