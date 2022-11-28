import 'package:flutter/material.dart';

import 'constants.dart';

class CalculateButton extends StatelessWidget {
  final String? text;
  final Function()? onTap;

  const CalculateButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomButtonColor,
        height: kBottomButtonHeight,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 15),
        child: Center(
          child: Text(
            text!,
            style: kCalculateButtonStyle,
          ),
        ),
      ),
    );
  }
}
