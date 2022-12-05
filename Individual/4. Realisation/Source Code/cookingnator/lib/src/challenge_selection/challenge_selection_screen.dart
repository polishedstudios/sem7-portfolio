import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'challenge_button/challenge_button_completed.dart';
import 'challenge_button/challenge_button_current.dart';
import 'challenge_button/challenge_button_skipped.dart';
import 'challenge_button/challenge_button_locked.dart';

class ChallengeSelectionScreen extends StatelessWidget {
  const ChallengeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 84,
            color: const Color.fromARGB(255, 206, 130, 255),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(6, 0, 8, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    rowItemMain(
                      'https://i.imgur.com/WPaUdx4.png',
                      () {}, // onPressed
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        rowItem(
                          'https://d35aaqx5ub95lt.cloudfront.net/vendor/398e4298a3b39ce566050e5c041949ef.svg',
                          "0",
                          () {}, // onPressed
                        ),
                        const SizedBox(width: 10),
                        rowItem(
                          'https://d35aaqx5ub95lt.cloudfront.net/vendor/aed279fcbad509208b45ca7a17f3e8dc.svg',
                          "0",
                          () {}, // onPressed
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            height: 3,
            thickness: 3,
            color: Color.fromARGB(255, 165, 104, 204),
          ),
          const SizedBox(height: 40),
          // everything from this point onwards is in ListView!!!

          // TODO:
          // create path & units hardcoded first, add chest in path
          // closed: https://d35aaqx5ub95lt.cloudfront.net/images/path/b841637c196f5be786d8b8578a42ffbf.svg
          // open: https://d35aaqx5ub95lt.cloudfront.net/images/path/8e1b4675455a4e453aac3681e0f5599e.svg
          // add country theme images behind (Stack)

          // test buttons
          ChallengeButtonCompleted(() {}), // onPressed
          ChallengeButtonCurrent(() {}),
          ChallengeButtonSkipped(() {}),
          ChallengeButtonLocked(() {}),
        ],
      ),
    );
  }

  Widget rowItemMain(text, onPressed) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Image.network(text)],
      ),
    );
  }

  Widget rowItem(icon, text, onPressed) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.network(
            icon,
          ),
          if (text != null) ...{
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          },
        ],
      ),
    );
  }
}
