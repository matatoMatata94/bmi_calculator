import 'package:flutter/material.dart';

const Color backGroundColor = Color(0xFF1D1E33);
const Color bottomButtonColor = Color(0xFFEB1555);
const double bottomButtonHeight = 80;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: const [
                  Expanded(
                    child: BackgroundCard(
                      color: backGroundColor,
                    ),
                  ),
                  Expanded(
                    child: BackgroundCard(
                      color: backGroundColor,
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
                child: BackgroundCard(
              color: backGroundColor,
            )),
            Expanded(
              child: Row(
                children: const [
                  Expanded(
                      child: BackgroundCard(
                    color: backGroundColor,
                  )),
                  Expanded(
                      child: BackgroundCard(
                    color: backGroundColor,
                  )),
                ],
              ),
            ),
            Container(
              color: bottomButtonColor,
              height: bottomButtonHeight,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 15),
            ),
          ],
        ),
      ),
    );
  }
}

class BackgroundCard extends StatefulWidget {
  final Color color;

  const BackgroundCard({required this.color});

  @override
  State<BackgroundCard> createState() => _BackgroundCardState();
}

class _BackgroundCardState extends State<BackgroundCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
