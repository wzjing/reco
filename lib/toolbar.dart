import 'package:flutter/material.dart';

class MainToolbar extends StatelessWidget implements PreferredSizeWidget {
  MainToolbar({Widget child}) : child = child;

  Widget child;

  @override
  Size get preferredSize => Size(0, 40);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: this.child,
      );
}
