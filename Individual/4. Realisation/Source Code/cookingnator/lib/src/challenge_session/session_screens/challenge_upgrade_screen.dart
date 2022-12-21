import 'package:cookingnator/src/buttons/image_button.dart';
import 'package:flutter/material.dart';
import '../../challenge_selection/topbar/session_topbar.dart';
import '../speech_bubble.dart';
import '../../buttons/secondary_button.dart';

class ChallengeUpgradeScreen extends StatelessWidget {
  const ChallengeUpgradeScreen(this.callback, {super.key});
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SessionTopBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(children: [
                const Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child:
                        Image(image: AssetImage('assets/challenges/Chef.png')),
                  ),
                ),
                BubbleBox(
                  shape: BubbleShapeBorder(
                    arrowHeight: 16,
                    arrowAngle: 12,
                    arrowQuadraticBezierLength: 7,
                    smooth: 0,
                    border:
                        BubbleBoxBorder(color: Colors.grey.shade300, width: 5),
                    direction: BubbleDirection.top,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(8, 12, 8, 7),
                    child: Text(
                      'Do you dare to take this challenge up to another level?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        height: 1.1,
                        color: Color.fromARGB(255, 39, 38, 39),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 27),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ImageButton('assets/challenges/CurryRice.png',
                            'Add chicken', () {}),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ImageButton(
                            'assets/challenges/BeefCurryRice.png',
                            'Add beef',
                            () {}),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                SecondaryButton('Not this time', () {
                  callback();
                }),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
