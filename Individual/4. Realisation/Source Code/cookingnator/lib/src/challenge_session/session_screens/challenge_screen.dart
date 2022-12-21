import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../challenge_selection/topbar/session_topbar.dart';
import '../../buttons/primary_button.dart';
import '../../buttons/secondary_button.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen(this.callback, {super.key});
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
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Curry Rice',
                          style: TextStyle(
                            color: Color.fromARGB(255, 39, 38, 39),
                            fontSize: 38,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          'カレーライス',
                          style: TextStyle(
                            color: Color.fromARGB(255, 98, 95, 98),
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          'Karēraisu',
                          style: TextStyle(
                            color: Color.fromARGB(255, 105, 101, 105),
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            child:
                                Image.asset('assets/challenges/CurryRice.png'),
                          ),
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/challenges/difficulty_1_jp.png',
                        width: 48,
                        height: 48,
                      ),
                      Image.asset(
                        'assets/challenges/difficulty_1_jp.png',
                        width: 48,
                        height: 48,
                      ),
                      Image.asset(
                        'assets/challenges/difficulty_2_jp.png',
                        width: 48,
                        height: 48,
                      ),
                      Image.asset(
                        'assets/challenges/difficulty_2_jp.png',
                        width: 48,
                        height: 48,
                      ),
                      Image.asset(
                        'assets/challenges/difficulty_2_jp.png',
                        width: 48,
                        height: 48,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  PrimaryButton('Accept challenge', () {
                    callback();
                  }),
                  const SizedBox(height: 5),
                  SecondaryButton('Skip for now', () {
                    GoRouter.of(context).go('/'); // "close" for now
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
