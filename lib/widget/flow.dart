import 'package:flutter/material.dart';
import 'dart:ui';

class CardDelegate extends FlowDelegate {
  double spacing;
  int spanCount;

  Size size;

  BoxConstraints constraints;

  CardDelegate({this.spacing = 12, this.spanCount = 2, this.constraints}) {
    this.size = Size(double.infinity, 400);
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    double x = 0;
    double y = 0;
    for (int i = 0; i < context.childCount; i++) {
      context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
      y += context.getChildSize(i).height;
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }

  @override
    Size getSize(BoxConstraints constraints) {
      return this.size;
    }
}


