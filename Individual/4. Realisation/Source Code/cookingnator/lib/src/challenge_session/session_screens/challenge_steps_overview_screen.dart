import 'package:flutter/material.dart';
import '../../challenge_selection/challenges/challenge.dart';
import '../session_topbar.dart';
import '../../buttons/primary_button.dart';

class ChallengeStepsOverviewScreen extends StatelessWidget {
  const ChallengeStepsOverviewScreen(this.challenge, this.callback,
      {super.key});
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
                        Text(
                          '${challenge.steps.length} steps •  ${challenge.duration.inMinutes} mins',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 105, 101, 105),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Expanded(
                          child: ListView(children: steps()),
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

  List<Widget> steps() {
    List<Widget> stepsRow = [];
    for (var i = 0; i < challenge.steps.length; i++) {
      if (i == 0) {
        stepsRow.add(stepRow(i + 1, challenge.steps.elementAt(i)));
      } else {
        Column column = Column(
          children: [
            Divider(
              thickness: 1,
              height: 15,
              color: Colors.grey.shade300,
            ),
            stepRow(i + 1, challenge.steps.elementAt(i)),
          ],
        );
        stepsRow.add(column);
      }
    }
    return stepsRow;
  }

  Widget stepRow(int i, DishStep step) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 13,
          child: Text(
            "$i",
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
            'assets/challenges/type-${step.type}.png',
          ),
        ),
        const SizedBox(width: 12),
        Text(
          step.title,
          style: const TextStyle(
            color: Color.fromARGB(255, 39, 38, 39),
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
