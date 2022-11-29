import 'package:bmi_calculator/components/background_card.dart';
import 'package:bmi_calculator/components/calculate_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.bmi});

  final int bmi;

  final Map<String, String> weightCategories = {
    'UNDERWEIGHT': 'You should eat more and exercise',
    'NORMAL': 'You should keep doing whatever you are doing',
    'OVERWEIGHT': 'You should eat less and exercise',
  };

  String checkBMI(int bmi) {
    if (bmi < 18) {
      return 'UNDERWEIGHT';
    } else if (bmi > 25) {
      return 'OVERWEIGHT';
    } else {
      return 'NORMAL';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              child: Center(
                child: Text(
                  'YOUR RESULT',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: BackgroundCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      checkBMI(bmi),
                      style: kResultTextStyle,
                    ),
                    Text(bmi.toString(), style: kBMITextStyle),
                    Text(
                      weightCategories[checkBMI(bmi)]!,
                      style: kExplanationTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            CalculateButton(
              buttonTitle: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
