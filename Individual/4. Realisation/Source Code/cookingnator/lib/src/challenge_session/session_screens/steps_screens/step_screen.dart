import 'package:flutter/material.dart';
import '../../../buttons/primary_button.dart';
import '../../../buttons/secondary_button.dart';
import '../../speech_bubble.dart';

class StepScreen extends StatelessWidget {
  const StepScreen(this.stepNumber, this.lastStepNumber, this.imagePath,
      this.instructionText, this.callbackBack, this.callbackContinue,
      {super.key});
  final Function callbackBack;
  final Function callbackContinue;
  final int stepNumber;
  final int lastStepNumber;
  final String imagePath;
  final String instructionText;

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
                SizedBox(
                  height: 110,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        alignment: Alignment.bottomCenter,
                        image: AssetImage(imagePath),
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: BubbleBox(
                          shape: BubbleShapeBorder(
                            arrowHeight: 14,
                            arrowAngle: 12,
                            arrowQuadraticBezierLength: 3,
                            smooth: 0,
                            border: BubbleBoxBorder(
                                color: Colors.grey.shade300, width: 5),
                            direction: BubbleDirection.left,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 7),
                            child: Text(
                              instructionText,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 21,
                                height: 1.1,
                                color: Color.fromARGB(255, 39, 38, 39),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 27),
                Expanded(
                  child: Container(
                    color: Colors.grey.shade300,
                    child: const Center(
                      child: Text(
                        '[demo image/video]',
                        style:
                            TextStyle(color: Color(0xFFa568cc), fontSize: 26),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    if (stepNumber != 1) ...{
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4.5,
                        child: Align(
                          alignment: Alignment.center,
                          child: SecondaryButton('Back', () {
                            callbackBack();
                          }),
                        ),
                      ),
                      const SizedBox(width: 10),
                    },
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: stepNumber != lastStepNumber
                            ? PrimaryButton('Continue', () {
                                callbackContinue();
                              })
                            : PrimaryButton('Finish', () {
                                callbackContinue();
                              }),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
