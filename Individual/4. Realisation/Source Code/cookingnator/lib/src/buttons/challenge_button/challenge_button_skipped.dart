import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../press_button.dart';

class ChallengeButtonSkipped extends StatelessWidget {
  const ChallengeButtonSkipped(this.onPressed, {super.key});
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: PressButton(
        style: const StyleOfPressButton(
          topColor: Color.fromARGB(255, 198, 198, 198),
          backColor: Color.fromARGB(255, 157, 157, 157),
        ),
        onPressed: () => onPressed(),
        child:
            SvgPicture.asset('assets/challenge_button_skipped.svg', height: 38),
      ),
    );
  }
}
