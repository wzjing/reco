import 'package:flutter/material.dart';

class MainToolbar extends StatelessWidget implements PreferredSizeWidget {
  MainToolbar({Widget child}) : child = child;

  final Widget child;

  @override
  Size get preferredSize => Size(0, 40);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: this.child,
      );
}

class TabTitle extends StatefulWidget {
  final List<String> titles;

  final TextStyle titleStyle;

  TabTitle(
      {@required this.titles,
      this.titleStyle = const TextStyle(
          color: Color(0xFF4F4F4F),
          fontSize: 16,
          fontWeight: FontWeight.bold)});

  @override
  State<StatefulWidget> createState() {
    return _TabTitle();
  }
}

class _TabTitle extends State<TabTitle> {
  List<Widget> _createTitles() {
    List<Widget> titles = new List();
    widget.titles.forEach((title) => titles.add(Padding(
          padding: EdgeInsets.all(6),
          child: Text(
            title,
            style: widget.titleStyle,
          ),
        )));
    return titles;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _createTitles(),
    );
  }
}
