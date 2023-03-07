import 'package:flutter/material.dart';

class LightAppBar extends StatelessWidget implements PreferredSizeWidget {
  LightAppBar({
    Key? key,
    this.actions,
    this.title,
    this.color,
    required this.backgroundColor,
  });

  final List<Widget>? actions;
  final Widget? title;
  final Color? color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      title: title,
      scrolledUnderElevation: 0,
      elevation: 0,
      toolbarHeight: 65.0,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => Size(0.0, 65.0);
}
