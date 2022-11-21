import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color backGroundColor = Color(0xFF1D1E33);
const Color bottomButtonColor = Color(0xFFEB1555);
const double bottomButtonHeight = 80;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: BackgroundCard(
                      color: backGroundColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(FontAwesomeIcons.mars),
                          Text('Male')
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: BackgroundCard(
                      color: backGroundColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(FontAwesomeIcons.mars),
                          Text('Male')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BackgroundCard(
                color: backGroundColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('HEIGHT'),
                    Text(heightValue.round().toString()),
                    Slider(
                        max: 200,
                        min: 120,
                        value: heightValue,
                        onChanged: (newValue) {
                          setState(() => heightValue = newValue);
                        }),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: BackgroundCard(
                      color: backGroundColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('WEIGHT'),
                          Text(weightValue.toString()),
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
                      color: backGroundColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('AGE'),
                          Text(ageValue.toString()),
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
