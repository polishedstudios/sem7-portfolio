import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../challenge_selection/challenges/challenge.dart';
import '../session_topbar.dart';
import '../../buttons/primary_button.dart';
import '../../buttons/secondary_button.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen(this.challenge, this.callback, {super.key});
  final Challenge challenge;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SessionTopBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          challenge.dishName.name,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 39, 38, 39),
                            fontSize: 38,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (challenge.dishName.original != null) ...{
                          Text(
                            challenge.dishName.original!,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 98, 95, 98),
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        },
                        if (challenge.dishName.originalPronunciation !=
                            null) ...{
                          Text(
                            challenge.dishName.originalPronunciation!,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 105, 101, 105),
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        },
                        const SizedBox(height: 18),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            child: challenge.image,
                          ),
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                  difficulty(),
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

  Widget difficulty() {
    List<Widget> icons = [];
    for (var i = 1; i <= 5; i++) {
      if (i <= challenge.difficulty) {
        icons.add(difficultyIcon(1));
      } else {
        icons.add(difficultyIcon(2));
      }
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: icons,
    );
  }

  Widget difficultyIcon(int version) {
    return Image.asset(
      'assets/challenges/difficulty_${version}_jp.png',
      width: 48,
      height: 48,
    );
  }
}
