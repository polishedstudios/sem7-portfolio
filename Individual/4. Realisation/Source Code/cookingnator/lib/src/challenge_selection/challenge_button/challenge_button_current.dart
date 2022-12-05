import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'challenge_button.dart';

class ChallengeButtonCurrent extends StatelessWidget {
  const ChallengeButtonCurrent(this.onPressed, {super.key});
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: ChallengeButton(
          style: const StyleOfChallengeButton(
            topColor: Color.fromARGB(255, 206, 130, 255),
            backColor: Color.fromARGB(255, 165, 104, 204),
          ),
          onPressed: () {
            onPressed();
          },
          child: SvgPicture.network(
            'https://d35aaqx5ub95lt.cloudfront.net/images/path/icons/ef9c771afdb674f0ff82fae25c6a7b0a.svg',
            height: 37,
          ),
        ));
  }
}
