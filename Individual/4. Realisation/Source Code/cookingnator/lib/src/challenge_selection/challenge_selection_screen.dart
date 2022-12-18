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
                UnitInfoBar(1, "Description blabla bla de scription."),
                // hardcoded
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      // should probably be Center and then Image in Padding with padding left instead.
                      top: 105,
                      left: 160,
                      child: Image.network(
                        'https://media.istockphoto.com/id/975920186/vector/curry-rice.jpg?s=612x612&w=0&k=20&c=k_nPHH22JKNC6YJHfv6Wa8SfibcrImp6Z0fhw8cCHhQ=',
                        width: 350,
                      ),
                    ),
                    Positioned(
                      top: 380,
                      right: 230,
                      child: Image.network(
                        'https://1001freedownloads.s3.amazonaws.com/vector/thumb/96933/miso-soup.png',
                        width: 270,
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
                            GoRouter.of(context).go('/session');
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
                UnitInfoBar(2, "Description blabla bla de scription."),
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
          ),

          // TODO:
          // create path & units from "units_jp.dart" & "challenges_jp.dart" (even if just 1), add chest in path
          // ^ could make these Stacks with containers and images as widget "UnitsJapanese".
          // closed: https://d35aaqx5ub95lt.cloudfront.net/images/path/b841637c196f5be786d8b8578a42ffbf.svg
          // locked: https://d35aaqx5ub95lt.cloudfront.net/images/path/8e1b4675455a4e453aac3681e0f5599e.svg
        ],
      ),
    );
  }
}
