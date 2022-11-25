import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'background_card.dart';
import 'constants.dart';
import 'icon_content.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  double heightValue = 160;
  int weightValue = 80;
  int ageValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: BackgroundCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars,
                        text: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: BackgroundCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus,
                        text: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BackgroundCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: kIconCardStyle,
                    ),
                    Text(
                      heightValue.round().toString(),
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTickMarkColor: const Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: const Color(0xFFEB1555),
                          overlayColor: const Color(0x29EB1555),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 30.0)),
                      child: Slider(
                          max: 200,
                          min: 120,
                          value: heightValue,
                          onChanged: (newValue) {
                            setState(() => heightValue = newValue);
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: BackgroundCard(
                      color: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: kIconCardStyle,
                          ),
                          Text(
                            weightValue.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FloatingActionButton(
                                child: const Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    weightValue++;
                                  });
                                },
                              ),
                              FloatingActionButton(
                                child: const Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    weightValue--;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: BackgroundCard(
                      color: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: kIconCardStyle,
                          ),
                          Text(
                            ageValue.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FloatingActionButton(
                                child: const Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    ageValue++;
                                  });
                                },
                              ),
                              FloatingActionButton(
                                child: const Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    ageValue--;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: kBottomButtonColor,
              height: kBottomButtonHeight,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 15),
              child: MaterialButton(
                child: const Text(
                  'CALCULATE',
                  style: TextStyle(fontSize: 45),
                ),
                onPressed: () => _dialogBuilder(
                    context, weightValue / pow(heightValue / 100, 2)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context, double bmi) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Your BMI',
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          content: Text(
            bmi.round().toString(),
            style: const TextStyle(fontSize: 25),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('OK'),
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
