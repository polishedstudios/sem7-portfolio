import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'challenge_button.dart';
import '/src/style/palette.dart';

class ChallengeButtonCurrent extends StatelessWidget {
  ChallengeButtonCurrent(this.onPressed, {super.key});
  final Function() onPressed;
  final Palette palette = Palette();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: ChallengeButton(
          style: StyleOfChallengeButton(
            topColor: palette.colorMain,
            backColor: palette.colorMainDark,
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
