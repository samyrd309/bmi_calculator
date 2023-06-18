import 'package:flutter/material.dart';

import 'constants.dart';


class BMIPage extends StatelessWidget {

  final double data;
  BMIPage({ required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Page'),
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text((data.toStringAsFixed(2)), style: kNumberStyle),
                Text(determinarNivelPeso(data), style: kTextStyle),
              ],
            ),
          ),
        ),
      );
  }
}

String determinarNivelPeso(double peso) {
  if (peso < 18.5) {
    return 'Bajo peso';
  } else if (peso >= 18.5 && peso <= 24.9) {
    return 'Normal';
  } else if (peso >= 25.0 && peso <= 29.9) {
    return 'Sobrepeso';
  } else {
    return 'Obesidad';
  }
}
