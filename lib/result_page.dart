import 'package:bmi_calculator/background_card.dart';
import 'package:bmi_calculator/calculate_button.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YOUR RESULT'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BackgroundCard(
              color: kActiveCardColor,
              cardChild: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      'CATEGORY',
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(
                      'Number',
                      style: TextStyle(fontSize: 90.0),
                    ),
                    Text(
                      'SOME EXPLANATION TEXT HERE',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          CalculateButton(
            text: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
