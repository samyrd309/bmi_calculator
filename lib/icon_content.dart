import 'package:flutter/cupertino.dart';

class IconContent extends StatelessWidget {
  IconContent({super.key,required this.iconData, required this.text});

  IconData iconData;
  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData,
          size: 50,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(text,
          style: TextStyle(
              fontSize: 20.0,
              color: Color(0XFF8D8E91)
          ),

        )
      ],
    );
  }
}