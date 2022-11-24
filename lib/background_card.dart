import 'package:flutter/cupertino.dart';

class BackgroundCard extends StatelessWidget {
  final Color color;
  final Widget? cardChild;
  final Function()? onPress;

  const BackgroundCard({required this.color, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: cardChild,
      ),
    );
  }
}
