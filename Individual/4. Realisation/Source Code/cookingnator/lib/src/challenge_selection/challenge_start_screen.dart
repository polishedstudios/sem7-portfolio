import 'package:flutter/material.dart';
import 'topbar/start_topbar.dart';
import '../buttons/primary_button.dart';
import '../buttons/secondary_button.dart';
import 'package:go_router/go_router.dart';

class ChallengeStartScreen extends StatelessWidget {
  const ChallengeStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StartTopBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: const [
                        Text(
                          'Hello',
                          style:
                              TextStyle(color: Color.fromARGB(255, 20, 19, 20)),
                        ),
                      ],
                    ),
                  ),
                  PrimaryButton('Accept challenge', () {}),
                  SecondaryButton('Skip for now', () {
                    Navigator.maybePop(context); // "close" for now
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
