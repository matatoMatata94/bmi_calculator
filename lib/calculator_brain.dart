import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.weight, required this.height});

  final double weight;
  final double height;

  late final double _bmi = weight / pow(height / 100, 2);

  String getBMIResult() {
    return _bmi.toStringAsFixed(0);
  }

  String getBMICategory() {
    if (_bmi < 18) {
      return 'UNDERWEIGHT';
    } else if (_bmi > 25) {
      return 'OVERWEIGHT';
    } else {
      return 'NORMAL';
    }
  }

  String getBMIInterpretation() {
    if (_bmi < 18) {
      return 'You should eat more and exercise';
    } else if (_bmi > 25) {
      return 'You should eat less and exercise';
    } else {
      return 'You should keep doing whatever you are doing';
    }
  }
}
