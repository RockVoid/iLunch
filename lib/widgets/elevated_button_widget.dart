import 'package:flutter/material.dart';
import 'package:ilunch/themes/app_themes.dart';

import '../themes/app_themes.dart';

class ElevatedButtonWidget extends StatefulWidget {
  final void Function()? onPressed;
  final Widget? child;
  final Color? color;
  final double elevation;
  final double width;
  final double heigth;
  final double left;
  final double right;
  final double top;
  final double bottom;

  const ElevatedButtonWidget({
    Key? key,
    this.onPressed = null,
    this.elevation = 2,
    this.width = 500,
    this.heigth = 55,
    this.left = 40,
    this.right = 40,
    this.top = 0,
    this.bottom = 0,
    this.color = null,
    required this.child,
  }) : super(key: key);

  @override
  State<ElevatedButtonWidget> createState() => _ElevatedButtonWidgetState();
}

class _ElevatedButtonWidgetState extends State<ElevatedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        widget.left,
        widget.top,
        widget.right,
        widget.bottom,
      ),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: widget.child,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          primary: widget.color==null ? Appthemes.primary : widget.color,
          elevation: widget.elevation,
          fixedSize: Size(widget.width, widget.heigth),
        ),
      ),
    );
  }
}
