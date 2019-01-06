import 'package:flutter/material.dart';
import 'dart:ui';

class CardDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    double x = 0;
    double y = 0;
    for (int i = 0; i < context.childCount; i++) {
      if (x > 0 && (x + context.getChildSize(i).width) > context.size.width) {
        x = 0;
        y += context.getChildSize(i).height;
      }
      print(
          'x: $x, y: $y item width: ${context.getChildSize(i).width}, width: ${context.size.width}');
      context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
      x += context.getChildSize(i).width;
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

class FlowCard extends StatefulWidget {
  final double width;

  final double height;

  // backgorund image
  final String image;

  // text tag to show
  final String tag;

  // click event
  final VoidCallback onPressed;

  FlowCard(
      {this.image,
      this.tag = 'TAG',
      @required this.onPressed,
      this.width = 200,
      this.height = 150});

  @override
  State<StatefulWidget> createState() {
    return _FlowCardState();
  }
}

class _FlowCardState extends State<FlowCard> {
  @override
  Widget build(BuildContext context) {
    var cover = widget.image != null
        ? Image.network(widget.image)
        : Image.asset('assets/graphics/cover.jpeg');

    var textStyle = TextStyle(
      color: Color(0xFFFFFF),
      fontSize: 14,
    );
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            image: DecorationImage(image: cover.image, fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(8),
            shape: BoxShape.rectangle),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(

              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                child: Text(
                  widget.tag,
                  style: textStyle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
