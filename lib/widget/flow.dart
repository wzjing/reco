import 'package:flutter/material.dart';
import 'dart:ui';

class FlowList extends StatelessWidget {
  List<FlowItem> children;

  FlowList({this.children});

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: CardDelegate(),
      children: children,
    );
  }
}

class FlowItem extends StatelessWidget {

  int widthSpan;
  int heightSpan;

  Widget child;

  FlowItem({this.widthSpan = 1, this.heightSpan = 1, this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

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
