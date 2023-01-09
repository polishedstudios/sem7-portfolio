import 'package:flutter/material.dart';
import '../../challenge_selection/challenges/challenge.dart';
import '../session_topbar.dart';
import '../../buttons/primary_button.dart';

class ChallengeNecessitiesScreen extends StatefulWidget {
  const ChallengeNecessitiesScreen(this.challenge, this.callback, {super.key});
  final Challenge challenge;
  final Function callback;

  @override
  State<ChallengeNecessitiesScreen> createState() =>
      _ChallengeNecessitiesScreen();
}

class _ChallengeNecessitiesScreen extends State<ChallengeNecessitiesScreen> {
  bool checked = false;
  List<bool> checkboxValue = [];

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
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "What you'll need...",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 39, 38, 39),
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 450),
                        child: widget.challenge.ingredientsImage,
                      ),
                      const SizedBox(height: 30),
                      Expanded(
                        child: ListView(children: ingredients()),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                PrimaryButton('Continue', () {
                  widget.callback();
                }),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> ingredients() {
    List<Widget> ingredientsRow = [];
    for (var i = 0; i < widget.challenge.ingredients.length; i++) {
      if (i == 0) {
        ingredientsRow
            .add(ingredientRow(widget.challenge.ingredients.elementAt(i)));
      } else {
        Column column = Column(
          children: [
            Divider(
              thickness: 1,
              height: 15,
              color: Colors.grey.shade300,
            ),
            ingredientRow(widget.challenge.ingredients.elementAt(i)),
          ],
        );
        ingredientsRow.add(column);
      }
    }
    return ingredientsRow;
  }

  Widget ingredientRow(String stepDescription) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 1.1,
          child: Checkbox(
            value:
                checked, // all generated checkboxes use the same state value for now.
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            activeColor: const Color(0xFFce82ff),
            onChanged: (bool? newValue) {
              setState(() {
                checked = newValue!;
              });
            },
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
    );
  }
}
