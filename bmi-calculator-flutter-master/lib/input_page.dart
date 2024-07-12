import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'calculator_brain.dart';

enum Gender { male, female }

void ChangeGender() {}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        child: ReusableCard(
                          colour: selectedGender == Gender.male
                              ? kActiveCardBackground
                              : kInactiveCardBackground,
                          childCard: IconContent(FontAwesomeIcons.mars, "Male"),
                          // onPress: () {
                          //   setState(() {
                          //     print('inside male');
                          //     selectedGender = Gender.male;
                          //   });
                          // }
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        child: ReusableCard(
                          colour: selectedGender == Gender.female
                              ? kActiveCardBackground
                              : kInactiveCardBackground,
                          childCard:
                              IconContent(FontAwesomeIcons.venus, "Female"),
                          // onPress: () {
                          //   setState(() {
                          //     print('inside female');
                          //     selectedGender = Gender.female;
                          //   });
                          // }
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardBackground,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: kInactiveCardBackground,
                            activeTrackColor: Colors.white,
                            thumbColor: kBottomContainerBackground,
                            overlayColor: Color(0X29EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 12.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 24.0)),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 250.0,
                          onChanged: (double newValue) {
                            setState(
                              () {
                                height = newValue.round();
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardBackground,
                        childCard: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Weight',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  child: Icon(FontAwesomeIcons.minus),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xFF4C4F5E),
                                  constraints: BoxConstraints.tightFor(
                                      width: 45.0, height: 45.0),
                                  elevation: 0.0,
                                ),
                                SizedBox(width: 5.0),
                                RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  child: Icon(FontAwesomeIcons.plus),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xFF4C4F5E),
                                  constraints: BoxConstraints.tightFor(
                                      width: 45.0, height: 45.0),
                                  elevation: 0.0,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardBackground,
                        childCard: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Age',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  child: Icon(FontAwesomeIcons.minus),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xFF4C4F5E),
                                  constraints: BoxConstraints.tightFor(
                                      width: 45.0, height: 45.0),
                                  elevation: 0.0,
                                ),
                                SizedBox(width: 5.0),
                                RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  child: Icon(FontAwesomeIcons.plus),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xFF4C4F5E),
                                  constraints: BoxConstraints.tightFor(
                                      width: 45.0, height: 45.0),
                                  elevation: 0.0,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  CalculatorBrain calc =
                      CalculatorBrain(height: height, weight: weight);
                  calc.calculateBMI();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        result: calc,
                      ),
                    ),
                  );
                },
                child: Container(
                  child: Center(
                    child: Text(
                      "Calculate",
                      style: kLargeButtonTextStyle,
                    ),
                  ),
                  padding: EdgeInsets.only(bottom: 20.0),
                  color: kBottomContainerBackground,
                  margin: EdgeInsets.only(top: 10.0),
                  width: double.infinity,
                  height: kBottomContainerHeight,
                ),
              )
            ],
          ),
        ));
  }
}
