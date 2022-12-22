import 'package:cookingnator/src/challenge_session/session_screens/steps_screens/step_screen.dart';
import 'package:flutter/material.dart';
import '../session_topbar.dart';

class ChallengeStepsScreen extends StatefulWidget {
  const ChallengeStepsScreen(this.callback, {super.key});
  final Function callback;

  @override
  State<ChallengeStepsScreen> createState() => _ChallengeStepsScreen();
}

class _ChallengeStepsScreen extends State<ChallengeStepsScreen> {
  int activeStep = 0;
  late int stepAmount;
  late List<StepScreen> stepScreens;

  @override
  initState() {
    stepScreens = [
      StepScreen(
        1,
        'assets/challenges/mawaru-penguindrum-4.gif',
        'Cut all ingredients into cubes of 2cm.',
        handlePrevious,
        handleNext,
      ),
      StepScreen(
        2,
        'assets/challenges/mawaru-penguindrum-3.gif',
        'Sauté onion pieces until the edges start browning.',
        handlePrevious,
        handleNext,
      ),
      StepScreen(
        3,
        'assets/challenges/mawaru-penguindrum-3.gif',
        'Add potato and carrot pieces to the pot and stir.',
        handlePrevious,
        handleNext,
      ),
      // presentation screen?
    ];
    stepAmount = stepScreens.length;
    super.initState();
  }

  handlePrevious() {
    setState(() {
      activeStep--;
    });
  }

  handleNext() {
    if (activeStep != (stepAmount - 1)) {
      setState(() {
        activeStep++;
      });
    } else if (activeStep == (stepAmount - 1)) {
      widget.callback();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SessionTopBar(
            stepAmount: stepAmount,
            activeStep: activeStep,
          ),
          Expanded(
            child: stepScreens.elementAt(activeStep),
          ),
        ],
      ),
    );
  }
}
