import 'package:flutter/cupertino.dart';

class CardContainer extends StatelessWidget {
  CardContainer({super.key, required this.color, required this.cardChild, required this.onPress});

  Color color;
  Widget cardChild;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: cardChild,
        height: 150.0,
        width: 170,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
      ),
      onTap: onPress,
    );
  }
}