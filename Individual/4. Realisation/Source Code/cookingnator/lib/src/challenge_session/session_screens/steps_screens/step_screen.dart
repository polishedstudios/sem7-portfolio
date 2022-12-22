import 'package:flutter/material.dart';
import '../../../buttons/primary_button.dart';

class StepScreen extends StatelessWidget {
  const StepScreen(this.stepNumber, this.callback, {super.key});
  final Function callback;
  final int stepNumber; // only for now

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "step $stepNumber",
                        style: const TextStyle(
                            color: Color(0xFFa568cc), fontSize: 60),
                      ),
                    ],
                  ),
                ),
                // add back button?
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
