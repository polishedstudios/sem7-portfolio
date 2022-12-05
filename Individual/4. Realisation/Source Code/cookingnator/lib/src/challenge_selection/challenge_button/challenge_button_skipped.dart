import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'challenge_button.dart';

class ChallengeButtonSkipped extends StatelessWidget {
  const ChallengeButtonSkipped(this.onPressed, {super.key});
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ChallengeButton(
        style: const StyleOfChallengeButton(
          topColor: Color.fromARGB(255, 198, 198, 198),
          backColor: Color.fromARGB(255, 157, 157, 157),
        ),
        onPressed: () {
          onPressed();
        },
        child: SvgPicture.network(
            'https://d35aaqx5ub95lt.cloudfront.net/images/path/icons/5e4203031e39fc43d94371565fd0d369.svg',
            height: 38),
      ),
    );
  }
}
