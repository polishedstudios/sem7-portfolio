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
            SvgPicture.network(
              'https://d35aaqx5ub95lt.cloudfront.net/images/path/04c71ff20ffdd493e967aec8fd5a864f.svg',
              height: 49,
            ),
            SvgPicture.network(
                'https://d35aaqx5ub95lt.cloudfront.net/images/path/icons/53727b0c96103443bc616435bb1f2fbc.svg',
                height: 42),
          ],
        ),
      ),
    );
  }
}
