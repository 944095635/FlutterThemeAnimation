import 'dart:math';

import 'package:flutter/material.dart';

class CirclePath extends CustomClipper<Path> {
  CirclePath(this.value);
  final double value;
  @override
  Path getClip(Size size) {
    //  debugPrint("size.width:" +
    //     size.width.toString() +
    //     " width " +
    //     size.height.toString());
    var path = Path();
    double h = (size.height - 32);
    double w = (size.width - 32);
    double radius = value *
        sqrt(h * h +
            w * w); //sqrt(size.height * size.height + size.width * size.width);

    path.addOval(Rect.fromLTRB(32 - radius, size.height - radius - 32,
        radius + 32, size.height + radius - 32));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
