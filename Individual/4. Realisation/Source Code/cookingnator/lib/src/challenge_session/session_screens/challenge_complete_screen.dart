import 'package:flutter/material.dart';
import '../../challenge_selection/topbar/session_topbar.dart';
import '../../buttons/primary_button.dart';
import '../box.dart';

class ChallengeCompleteScreen extends StatelessWidget {
  const ChallengeCompleteScreen(this.callback, {super.key});
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
                const SizedBox(height: 26),
                const Text(
                  'Challenge\n completed!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 39, 38, 39),
                    fontSize: 43,
                    fontWeight: FontWeight.w600,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 45),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Image(
                            image:
                                AssetImage('assets/challenges/CurryRice.png'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Curry Rice',
                        style: TextStyle(
                          color: Color.fromARGB(255, 39, 38, 39),
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // const Text(
                      //   '+20XP',
                      //   style: TextStyle(
                      //     color: Color(0xFFA568CC),
                      //     fontSize: 27,
                      //     fontWeight: FontWeight.w600,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Box(
                      text: 'TOTAL XP',
                      child: Text(
                        '+20',
                        style: TextStyle(
                          color: Color(0xFFA568CC),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 17),
                    Box(
                      text: 'Time',
                      child: Text(
                        '35:42',
                        style: TextStyle(
                          color: Color(0xFFA568CC),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                PrimaryButton('Continue', () {
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
