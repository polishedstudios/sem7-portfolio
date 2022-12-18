import 'package:flutter/material.dart';
import 'session_screens/challenge_screen.dart';
import 'session_screens/challenge_upgrade_screen.dart';
import 'session_screens/steps_screen.dart';
import 'session_screens/challenge_presentation_screen.dart';
import 'session_screens/challenge_complete_screen.dart';
import 'loading_screen.dart';

class ChallengeSessionScreen extends StatefulWidget {
  const ChallengeSessionScreen({super.key});
  @override
  State<ChallengeSessionScreen> createState() => _ChallengeSessionScreenState();
}

class _ChallengeSessionScreenState extends State<ChallengeSessionScreen> {
  int activeStep = 0;

  // whole challenge state here too
  // for persistence: send timeSpent in callback in the Steps Screen

  // below screens all reuse topbar,, not in this file.
  // - Challenge/Dish Screen
  // - Challenge/Dish Upgrade Screen
  // - Loading Screen
  // - Step Screen -> has DotStepper + sub widgets
  // - (opt) Challenge/Dish Presentation Screen
  // - Challenge Complete Screen

  // need to add callbacks to next buttons in screens (except Step Screen, this needs one in sub-widget).

  acceptedChallenge() {
    setState(() {
      activeStep = 1;
    });
  }

  choseUpgrade() {
    setState(() {
      activeStep = 3; // 2
    });
  }

  finishedLoading() {
    setState(() {
      activeStep = 3;
    });
  }

  finishedSteps() {
    setState(() {
      activeStep = 4;
    });
  }

  chosePresentation() {
    setState(() {
      activeStep = 5;
    });
  }

  closeChallenge() {
    // GoRouter
  }

  Widget _buildBody(int index) {
    // fix with https://pub.dev/packages/flutter_bloc
    // https://bloclibrary.dev/#/fluttercountertutorial
    print(index);
    switch (index) {
      case 0:
        return ChallengeScreen(acceptedChallenge);
      case 1:
        return ChallengeUpgradeScreen(choseUpgrade);
      case 2:
        return const LoadingScreen();
      case 3:
        return StepsScreen(finishedSteps);
      case 4:
        return ChallengePresentationScreen(chosePresentation);
      case 5:
        ChallengeCompleteScreen(closeChallenge);
    }
    return ChallengeScreen(acceptedChallenge);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(activeStep),
    );
  }
}
