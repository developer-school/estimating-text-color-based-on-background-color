import 'dart:math';

import 'package:flutter/material.dart';

Color getRandomBackgroundColor() {
  List<Color> colors = [
    ...Colors.primaries,
    ...Colors.accents,
  ];

  return colors[Random().nextInt(colors.length)];
}

Color getTextColorForBackground(Color backgroundColor) {
  if (ThemeData.estimateBrightnessForColor(backgroundColor) == Brightness.dark) {
    return Colors.white;
  }

  return Colors.black;
}

class ColorEstimationPage extends StatefulWidget {
  const ColorEstimationPage({Key? key}) : super(key: key);

  @override
  State<ColorEstimationPage> createState() => _ColorEstimationPageState();
}

class _ColorEstimationPageState extends State<ColorEstimationPage> {
  late Color bgColor;
  late Color textColor;

  @override
  void initState() {
    super.initState();

    getColors();
  }

  void getColors() {
    bgColor = getRandomBackgroundColor();
    textColor = getTextColorForBackground(bgColor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: TextButton(
          onPressed: () {
            setState(() {
              getColors();
            });
          },
          child: Text(
            "Tap me to get a new color",
            style: Theme.of(context).textTheme.headline2?.copyWith(
                  color: textColor,
                ),
          ),
        ),
      ),
    );
  }
}
