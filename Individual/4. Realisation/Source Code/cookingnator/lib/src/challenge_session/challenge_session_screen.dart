import 'package:flutter/material.dart';
import 'session_screens/challenge_screen.dart';
import 'session_screens/loading_screen.dart';
import 'session_screens/challenge_upgrade_screen.dart';
import 'session_screens/challenge_steps_overview_screen.dart';
import 'session_screens/challenge_necessities_screen.dart';
import 'session_screens/challenge_steps_screen.dart';
import 'session_screens/steps_screens/step_presentation_screen.dart';
import 'session_screens/challenge_complete_screen.dart';

class ChallengeSessionScreen extends StatefulWidget {
  const ChallengeSessionScreen({super.key});
  @override
  State<ChallengeSessionScreen> createState() => _ChallengeSessionScreenState();
}

class _ChallengeSessionScreenState extends State<ChallengeSessionScreen> {
  int activeStep = 0;
  late ChallengeScreen challengeScreen;
  late ChallengeUpgradeScreen upgradeScreen;
  late ChallengeNecessitiesScreen necessitiesScreen;
  late ChallengeStepsOverviewScreen stepsOverviewScreen;
  late LoadingScreen loadingScreen;
  late ChallengeStepsScreen stepsScreen;
  late ChallengeCompleteScreen completeScreen;

  @override
  initState() {
    challengeScreen = ChallengeScreen(acceptedChallenge);
    upgradeScreen = ChallengeUpgradeScreen(choseUpgrade);
    necessitiesScreen = ChallengeNecessitiesScreen(finishedNecessities);
    stepsOverviewScreen = ChallengeStepsOverviewScreen(finishedStepsOverview);
    loadingScreen = LoadingScreen(finishedLoading);
    stepsScreen = ChallengeStepsScreen(finishedSteps);
    completeScreen = ChallengeCompleteScreen(closeChallenge);
    super.initState();
  }

  acceptedChallenge() {
    setState(() {
      activeStep = 1;
    });
  }

  choseUpgrade() {
    setState(() {
      activeStep = 2;
    });
  }

  finishedNecessities() {
    setState(() {
      activeStep = 3;
    });
  }

  finishedStepsOverview() {
    setState(() {
      activeStep = 4;
    });
  }

  finishedLoading() {
    setState(() {
      activeStep = 5;
    });
  }

  finishedSteps() {
    setState(() {
      activeStep = 6;
    });
  }

  closeChallenge() {
    // GoRouter
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return challengeScreen;
      case 1:
        return upgradeScreen;
      case 2:
        return necessitiesScreen;
      case 3:
        return stepsOverviewScreen;
      case 4:
        return loadingScreen;
      case 5:
        return stepsScreen;
      case 6:
        return completeScreen;
    }
    return challengeScreen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(activeStep),
    );
  }
}
