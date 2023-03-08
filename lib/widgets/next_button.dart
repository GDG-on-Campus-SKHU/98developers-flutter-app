import 'package:flutter/material.dart';
import 'package:zikiza/utilities/constants.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    Key? key,
    required this.onPressed,
    required this.fillColor,
    required this.color,
  });

  final VoidCallback? onPressed;
  final Color? fillColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(
        Icons.arrow_forward,
        color: color,
        size: 24.0,
      ),
      padding: const EdgeInsets.all(Spacing.medium),
      elevation: 0.0,
      shape: CircleBorder(),
      fillColor: fillColor,
    );
  }
}
