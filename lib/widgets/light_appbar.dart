import 'package:zikiza/utilities/palette.dart';
import 'package:flutter/material.dart';

class LightAppBar extends StatelessWidget implements PreferredSizeWidget {
  LightAppBar({Key? key, required this.actions});

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      scrolledUnderElevation: 0,
      elevation: 0,
      backgroundColor: Palette.white,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => Size(0.0, 55.0);
}
