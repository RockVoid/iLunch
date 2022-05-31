import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilunch/themes/app_themes.dart';

class ProductTile extends StatelessWidget {
  final String title;
  final String description;
  final double value;
  final int unity;
  final String linkImage;
  final bool vendedorButtons;
  final VoidCallback? onPressedDelete;
  final VoidCallback? onPressedEdit;
  final VoidCallback? onTap;

  const ProductTile({
    Key? key,
    required this.title,
    required this.description,
    required this.value,
    required this.unity,
    required this.linkImage,
    this.vendedorButtons = false,
    this.onPressedDelete,
    this.onPressedEdit,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap ?? () {},
          child: Column(
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                            text: '$description',
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
                        'R\$ $value   •   $unity unidade(s)',
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
                    height: MediaQuery.of(context).size.height * 0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage('$linkImage'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ]),
              SizedBox(
                height: 5,
              ),
              if (vendedorButtons == true)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        primary: Appthemes.primary,
                        side: BorderSide(
                          width: 0.8,
                          color: Appthemes.primary,
                        ),
                        backgroundColor: Colors.white,
                      ),
                      onPressed: onPressedDelete ?? () {},
                      icon: Icon(
                        Icons.delete,
                        size: 18,
                      ),
                      label: Text(
                        'Deletar Produto',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    // SizedBox(width: 10),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        primary: Appthemes.primary,
                        side: BorderSide(
                          width: 0.8,
                          color: Appthemes.primary,
                        ),
                        backgroundColor: Colors.white,
                      ),
                      onPressed: onPressedEdit ?? () {},
                      icon: Icon(
                        Icons.edit,
                        size: 18,
                      ),
                      label: Text(
                        'Editar Produto',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
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
