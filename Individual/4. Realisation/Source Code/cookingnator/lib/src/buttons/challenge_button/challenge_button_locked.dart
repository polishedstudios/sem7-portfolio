import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../press_button.dart';

class ChallengeButtonLocked extends StatelessWidget {
  const ChallengeButtonLocked(this.onPressed, {super.key});
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: PressButton(
        style: const StyleOfPressButton(
          topColor: Color.fromARGB(255, 223, 223, 223),
          backColor: Color.fromARGB(255, 173, 173, 173),
        ),
        onPressed: () => onPressed(),
        child:
            SvgPicture.asset('assets/challenge_button_locked.svg', height: 36),
      ),
    );
  }
}
