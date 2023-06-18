import 'dart:math';

import 'package:bmi_calculator/bmi_model.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/square_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bmi_calculated_page.dart';
import 'card_container.dart';
import 'icon_content.dart';

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  var selectedGender;
  int height = 120;
  int weight = 0;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMICalculator'),
      ),
      body:Column(
        children: [
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardContainer(
                color: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                cardChild: IconContent(iconData: FontAwesomeIcons.mars, text: 'MALE',
                ),
                  onPress: (){
                    setState(() {
                      selectedGender =  Gender.male;
                    });
                  },
              ),
              CardContainer(
                color: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                cardChild: IconContent(iconData: FontAwesomeIcons.venus, text: 'FEMALE',
                ),
                onPress: (){
                  setState(() {
                    selectedGender =  Gender.female;
                  });
                },
              ),
            ],
          ),
          ),
           Row(
             children: [
               Expanded(
                 child: CardContainer
                 (
                  color: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text('HEIGHT',
                          style: kTextStyle,
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                        Text(
                          height.toString(),
                          style: kNumberStyle,
                        ),
                        Text(
                          'cm', style: kTextStyle,
                        )
                      ],
                      ),
                      SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15.0
                            ),
                            overlayShape: RoundSliderOverlayShape(
                              overlayRadius: 30.0
                            ),
                            overlayColor: Color(0X29EB1555),
                            thumbColor: Color(0XFFEB1555),
                            activeTrackColor: Color(0XFFEB1555),
                            inactiveTrackColor: Color(0X29EB1555)
                          ),

                          child:   Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220,
                          onChanged: (newValue){
                            setState(() {
                              height = newValue.round();
                            });
                          }))
                    ],
                  ),
                   onPress: (){},
                 ),
               ),
             ],
           ),
           Expanded(
             child: Row(
             children: [
               CardContainer(
                 color: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(weight.toString(),
                            style: kNumberStyle,
                          ),
                          Text(
                            'kg', style: kTextStyle,
                          ),
                        ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SquareRoundedButton(
                            icon: FontAwesomeIcons.minus,
                            color: kSquareRoundedButtonDefaultColor,
                            height: 50.0,
                            width: 50.0,
                            onPressed: (){
                              setState(() {
                                if(weight > 0){
                                  weight--;
                                }
                              });
                            }
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        SquareRoundedButton(
                            icon: FontAwesomeIcons.plus,
                            color: kSquareRoundedButtonDefaultColor,
                            height: 50.0,
                            width: 50.0,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            }
                        )
                      ],
                    )
                    ],
                  ),
                 onPress: (){},
               ),
               CardContainer(
                 color: kActiveCardColor,
                 cardChild: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       'AGE',
                       style: kTextStyle,
                     ),
                     Text(age.toString(),
                       style: kNumberStyle,
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         SquareRoundedButton(
                             icon: FontAwesomeIcons.minus,
                             color: kSquareRoundedButtonDefaultColor,
                             height: 50.0,
                             width: 50.0,
                             onPressed: (){
                               setState(() {
                                 if(age > 18){
                                   age--;
                                 }
                               });
                             }
                         ),
                         SizedBox(
                           width: 10.0,
                         ),
                         SquareRoundedButton(
                             icon: FontAwesomeIcons.plus,
                             color: kSquareRoundedButtonDefaultColor,
                             height: 50.0,
                             width: 50.0,
                             onPressed: (){
                               setState(() {
                                 age++;
                               });
                             }
                         )
                       ],
                     )
                   ],
                 ),
                 onPress: (){},
               ),
             ],
           ),
           ),
          Container(
            color: kActiveCardColor,
            height: 60.0,
            width: double.infinity,
            margin: EdgeInsets.only(top: 15.0),
            child: GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    elevation: 0.0,
                    child: Icon(FontAwesomeIcons.arrowRightLong),
                    constraints: BoxConstraints.tightFor(
                    height: 50.0,
                    width: 150.0
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                      10.0
                    ),
                    side: BorderSide(width: 3.0, color: Colors.white),
                    ),
                    fillColor: Colors.transparent,
                    onPressed: (){
                      if(weight.toDouble()!=0.0){
                        double result = bmiCalculation(height.toDouble(), weight.toDouble());
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context){
                              return BMIPage(data: result,);
                            })
                        );
                      }
                      else{
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Error'),
                              content: Text('No se puede igresar un peso menor que 1kg. Por favor ingrese otra cantidad'),
                              actions: [
                                TextButton(
                                  child: Text('Cerrar'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }
                  )
                ],
              ),
            ),

          )
        ],
      )
    );
  }
}

double bmiCalculation (double height, double weight){
  double base = (height/100);
  return weight / pow(base, 2);
}




