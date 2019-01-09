import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';

class CoverCard extends StatefulWidget {
  final String title;

  CoverCard(this.title);

  @override
  State<StatefulWidget> createState() {
    return _CoverCardState();
  }
}

class _CoverCardState extends State<CoverCard> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/graphics/cover.jpg'),
            fit: BoxFit.fitWidth,
          ),
          borderRadius: BorderRadius.all(Radius.circular(6)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0x2F000000),
              offset: Offset(6, 3),
              blurRadius: 6,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Align(
          alignment: Alignment.topRight,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4))),
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
              child: Text(widget.title),
            ),
          ),
        ),
      ),
    );
  }
}

class TitleCard extends StatefulWidget {
  final double width;

  final double height;

  // background image
  final String image;

  // text tag to show
  final String tag;

  // click event
  final VoidCallback onPressed;

  Size get size => Size(width, height);

  set size(Size value) => null;

  TitleCard(
      {this.image,
      this.tag = 'TAG',
      @required this.onPressed,
      this.width = 180,
      this.height = 120}) {
    this.size = Size(this.width, this.height);
  }

  @override
  State<StatefulWidget> createState() {
    return _TitleCardState();
  }
}

class _TitleCardState extends State<TitleCard> {
  @override
  Widget build(BuildContext context) {
    var cover = widget.image != null
        ? Image.asset(widget.image)
        : Image.asset('assets/graphics/cover.jpg');

    var textStyle = TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      background: Paint()..color = Colors.transparent,
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
        child: Container(
          padding: EdgeInsets.all(5),
          alignment: Alignment.bottomLeft,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: 56,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      shape: BoxShape.rectangle,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                ),
                Text(
                  widget.tag,
                  style: textStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
