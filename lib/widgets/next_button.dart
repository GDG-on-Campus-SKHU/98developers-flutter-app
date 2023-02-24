
import 'package:flutter/material.dart';
import 'package:app/utilities/constants.dart';
import 'package:app/utilities/palette.dart';

/** NextButton 클래스는 Launch 스크린의 Pageview 이동을 도와주는 버튼을 포함하고 있어요. */
class NextButton extends StatelessWidget {
  const NextButton({Key? key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(
        Icons.arrow_forward,
        color: Palette.white,
        size: 24.0,
      ),
      padding: const EdgeInsets.all(Spacing.medium),
      elevation: 0.0,
      shape: CircleBorder(),
      fillColor: Palette.sapphire,
    );
  }
}
