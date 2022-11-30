import 'package:bmi_calculator/components/background_card.dart';
import 'package:bmi_calculator/components/calculate_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    required this.bmi,
    required this.bmiCategory,
    required this.bmiInterpretation,
  });

  final String bmiCategory;
  final String bmi;
  final String bmiInterpretation;

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
                      bmiCategory,
                      style: kResultTextStyle,
                    ),
                    Text(bmi.toString(), style: kBMITextStyle),
                    Text(
                      bmiInterpretation,
                      style: kInterpretationTextStyle,
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
