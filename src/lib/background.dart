import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background(
      {Key? key, required this.leftColor, required this.rightColor})
      : super(key: key);

  final List<Color> leftColor;
  final Color rightColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 216,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: leftColor,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: rightColor,
          ),
        ),
      ],
    );
  }
}
