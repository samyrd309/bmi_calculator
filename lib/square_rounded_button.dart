import 'package:flutter/material.dart';

class SquareRoundedButton extends StatelessWidget {
  SquareRoundedButton({Key? key, required this.color,  required this.icon, required this.onPressed, required this.height, required this.width}) : super(key: key);

  final IconData icon;
  final void Function() onPressed;
  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        elevation: 0.0,
        child: Icon(icon),
        constraints: BoxConstraints.tightFor(
            height: height,
            width: width
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                10.0
            ),
        ),

        fillColor: color,
        onPressed: onPressed
    );
  }
}

