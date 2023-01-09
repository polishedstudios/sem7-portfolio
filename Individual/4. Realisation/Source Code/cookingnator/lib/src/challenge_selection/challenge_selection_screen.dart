import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'topbar/selection_topbar.dart';
import 'units/unit_infobar.dart';
import '../buttons/challenge_button/challenge_button_completed.dart';
import '../buttons/challenge_button/challenge_button_current.dart';
import '../buttons/challenge_button/challenge_button_locked.dart';

class ChallengeSelectionScreen extends StatelessWidget {
  const ChallengeSelectionScreen({super.key});
  final Color mainColor = const Color.fromARGB(255, 206, 130, 255);
  final Color mainColorDark = const Color.fromARGB(255, 165, 104, 204);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SelectionTopBar(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                UnitInfoBar(1,
                    "Start with some easy but popular dishes from the Japanese cuisine."),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    const Positioned(
                      bottom: -28,
                      right: -120,
                      child: Image(
                        image:
                            AssetImage('assets/challenges/SalmonRiceballs.png'),
                        width: 620,
                        opacity: AlwaysStoppedAnimation(.91),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 60),
                          child: ChallengeButtonCompleted(() {}),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 130),
                          child: ChallengeButtonCompleted(() {}),
                        ),
                        //..
                        Container(
                          margin: const EdgeInsets.only(right: 160),
                          child: ChallengeButtonCurrent(() {
                            GoRouter.of(context).go('/session/Curry Rice');
                          }),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 95),
                          child: ChallengeButtonLocked(() {}),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: ChallengeButtonLocked(() {}),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 70),
                          child: ChallengeButtonLocked(() {}),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 45),
                          child: ChallengeButtonLocked(() {}),
                        ),
                        const SizedBox(height: 18),
                      ],
                    ),
                  ],
                ),
                UnitInfoBar(2, "Start taking on more difficult dishes."),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    const Positioned(
                      bottom: -93,
                      left: -72,
                      child: Image(
                        image: AssetImage('assets/challenges/CurryRice.png'),
                        width: 600,
                        opacity: AlwaysStoppedAnimation(.91),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 70),
                          child: ChallengeButtonLocked(() {}),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 140),
                          child: ChallengeButtonLocked(() {}),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 180),
                          child: ChallengeButtonLocked(() {}),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 130),
                          child: ChallengeButtonLocked(() {}),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 50),
                          child: ChallengeButtonLocked(() {}),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 45),
                          child: ChallengeButtonLocked(() {}),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 110),
                          child: ChallengeButtonLocked(() {}),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 90),
                          child: ChallengeButtonLocked(() {}),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 40),
                          child: ChallengeButtonLocked(() {}),
                        ),
                        const SizedBox(height: 18),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // chest icons to use:
          // locked: https://d35aaqx5ub95lt.cloudfront.net/images/path/b841637c196f5be786d8b8578a42ffbf.svg
          // open: https://d35aaqx5ub95lt.cloudfront.net/images/path/8e1b4675455a4e453aac3681e0f5599e.svg
          // closed: https://d35aaqx5ub95lt.cloudfront.net/images/path/09f977a3e299d1418fde0fd053de0beb.svg
        ],
      ),
    );
  }
}
