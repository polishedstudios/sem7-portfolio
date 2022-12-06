import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'challenge_button.dart';

class ChallengeButtonLocked extends StatelessWidget {
  const ChallengeButtonLocked(this.onPressed, {super.key});
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ChallengeButton(
        style: const StyleOfChallengeButton(
          topColor: Color.fromARGB(255, 223, 223, 223),
          backColor: Color.fromARGB(255, 173, 173, 173),
        ),
        onPressed: () {
          onPressed();
        },
        child: SvgPicture.network(
            'https://d35aaqx5ub95lt.cloudfront.net/images/path/icons/261caf5e7127c22944a432ef5c191cfa.svg',
            height: 36),
      ),
    );
  }
}
