import 'package:cookingnator/src/challenge_session/session_screens/steps_screens/step_screen.dart';
import 'package:flutter/material.dart';
import '../../challenge_selection/challenges/challenge.dart';
import '../session_topbar.dart';

class ChallengeStepsScreen extends StatefulWidget {
  const ChallengeStepsScreen(this.challenge, this.callback, {super.key});
  final Challenge challenge;
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
    stepScreens = getSteps();
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

  List<StepScreen> getSteps() {
    List<StepScreen> steps = [];
    for (var i = 0; i < widget.challenge.steps.length; i++) {
      DishStep step = widget.challenge.steps.elementAt(i);
      steps.add(StepScreen(
        i + 1,
        widget.challenge.steps.length,
        getImagePath(step.type),
        step.instruction,
        handlePrevious,
        handleNext,
      ));
    }
    return steps;
  }

  String getImagePath(String type) {
    switch (type) {
      case 'prep':
        return 'assets/challenges/mawaru-penguindrum-4.gif';
      case 'cook':
        return 'assets/challenges/mawaru-penguindrum-3.gif';
      case 'presentation':
        return 'assets/challenges/mawaru-penguindrum-6.gif';
      default:
        return 'assets/challenges/mawaru-penguindrum-3.gif';
    }
  }
}
