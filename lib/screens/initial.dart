import 'package:flutter/material.dart';
import 'package:zikiza/widgets/light_appbar.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext _) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(child: Container()),
          Positioned(child: Container()),
        ],
      ),
      appBar: LightAppBar(
        actions: [],
        title: const Text(""),
        color: Theme.of(_).colorScheme.primary,
      ),
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  GoogleSignInButton({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.color,
    required this.minHeight,
    required this.minWidth,
    required this.maxHeight,
    required this.maxWidth,
  });

  final VoidCallback? onPressed;
  final Widget? child;
  final Color? color;
  final double minHeight;
  final double minWidth;
  final double maxHeight;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: child,
      fillColor: color,
      constraints: BoxConstraints(
        minHeight: minHeight,
        minWidth: minWidth,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}
