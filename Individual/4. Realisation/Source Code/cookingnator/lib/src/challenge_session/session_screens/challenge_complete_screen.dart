import 'package:flutter/material.dart';
import '../../challenge_selection/challenges/challenge.dart';
import '../session_topbar.dart';
import '../../buttons/primary_button.dart';
import '../box.dart';

class ChallengeCompleteScreen extends StatelessWidget {
  const ChallengeCompleteScreen(this.challenge, this.callback, {super.key});
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: challenge.image,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        challenge.dishName.name,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 39, 38, 39),
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    statBox('Total XP', '+20'),
                    const SizedBox(width: 17),
                    statBox('Time', '35:42'),
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

  Widget statBox(String title, String value) {
    return Box(
      text: title,
      child: Text(
        value,
        style: const TextStyle(
          color: Color(0xFFA568CC),
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
