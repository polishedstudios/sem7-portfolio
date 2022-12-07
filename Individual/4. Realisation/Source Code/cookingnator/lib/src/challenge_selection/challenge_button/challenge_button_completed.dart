import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'challenge_button.dart';

class ChallengeButtonCompleted extends StatelessWidget {
  const ChallengeButtonCompleted(this.onPressed, {super.key});
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ChallengeButton(
        style: StyleOfChallengeButton(
          topColor: Colors.yellow.shade600,
          backColor: const Color.fromARGB(255, 235, 158, 36),
        ),
        onPressed: () {
          onPressed();
        },
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SvgPicture.asset(
              'assets/challenge_button_shine.svg',
              height: 49,
            ),
            SvgPicture.asset('assets/challenge_button_check.svg', height: 42),
          ],
        ),
      ),
    );
  }
}
