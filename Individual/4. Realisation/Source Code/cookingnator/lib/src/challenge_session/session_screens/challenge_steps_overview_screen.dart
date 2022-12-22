import 'package:flutter/material.dart';
import '../session_topbar.dart';
import '../../buttons/primary_button.dart';

class ChallengeStepsOverviewScreen extends StatelessWidget {
  const ChallengeStepsOverviewScreen(this.callback, {super.key});
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
                        const SizedBox(height: 20),
                        const Text(
                          "Let's get started!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 39, 38, 39),
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            height: 1.1,
                          ),
                        ),
                        const Text(
                          '7 steps  •  30 mins',
                          style: TextStyle(
                            color: Color.fromARGB(255, 105, 101, 105),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Expanded(
                          child: ListView(
                            children: [
                              mockRow(1, "prep", "Prepare ingredients"),
                              mockRow(2, "cook", "Cook rice and set aside"),
                              mockRow(3, "cook", "Sauté onion pieces"),
                              mockRow(
                                  4, "cook", "Add potato and carrot pieces"),
                              mockRow(5, "cook",
                                  "Add water and bring it to a boil"),
                              mockRow(6, "cook", "Add curry roux and cook"),
                              mockRow(7, "presentation", "Present your dish"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  PrimaryButton("Let's start!", () {
                    callback();
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget mockRow(int stepNumber, String type, String stepDescription) {
    return Column(
      children: [
        if (stepNumber != 1) ...{
          Divider(
            thickness: 1,
            height: 15,
            color: Colors.grey.shade300,
          ),
        },
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 13,
              child: Text(
                "$stepNumber",
                style: const TextStyle(
                  color: Color.fromARGB(255, 39, 38, 39),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 30,
              child: Image.asset(
                'assets/challenges/type-$type.png',
              ),
            ),
            const SizedBox(width: 12),
            Text(
              stepDescription,
              style: const TextStyle(
                color: Color.fromARGB(255, 39, 38, 39),
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
