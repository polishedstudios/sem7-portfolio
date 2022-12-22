import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../press_button.dart';

class ChallengeButtonCurrent extends StatelessWidget {
  const ChallengeButtonCurrent(this.onPressed, {super.key});
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: PressButton(
          onPressed: () => onPressed(),
          child: SvgPicture.asset(
            'assets/challenge_button_star.svg',
            height: 37,
          ),
        ));
  }
}
