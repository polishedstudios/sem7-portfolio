import 'package:flutter/material.dart';
import '../../challenge_selection/topbar/session_topbar.dart';
import '../../buttons/primary_button.dart';

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
                Expanded(
                  child: Column(
                    children: const [
                      Text(
                        "Complete Screen",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ), // rest in here
                ),
                const SizedBox(height: 30),
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
