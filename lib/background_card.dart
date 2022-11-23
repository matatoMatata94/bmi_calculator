import 'package:flutter/cupertino.dart';

class BackgroundCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;

  BackgroundCard({super.key, required this.color, required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: cardChild,
    );
  }
}
