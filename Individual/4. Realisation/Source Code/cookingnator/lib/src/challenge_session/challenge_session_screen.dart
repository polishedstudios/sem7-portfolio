import 'package:flutter/material.dart';
import 'session_screens/challenge_screen.dart';
import 'session_screens/loading_screen.dart';
import 'session_screens/challenge_upgrade_screen.dart';
import 'session_screens/challenge_steps_overview_screen.dart';
import 'session_screens/challenge_necessities_screen.dart';
import 'session_screens/steps_screen.dart';
import 'session_screens/challenge_presentation_screen.dart';
import 'session_screens/challenge_complete_screen.dart';

class ChallengeSessionScreen extends StatefulWidget {
  const ChallengeSessionScreen({super.key});
  @override
  State<ChallengeSessionScreen> createState() => _ChallengeSessionScreenState();
}

class _ChallengeSessionScreenState extends State<ChallengeSessionScreen> {
  int activeStep = 0;
  late ChallengeScreen challengeScreen;
  late LoadingScreen loadingScreen;
  late ChallengeUpgradeScreen upgradeScreen;
  late ChallengeStepsOverviewScreen stepsOverviewScreen;
  late ChallengeNecessitiesScreen necessitiesScreen;
  late StepsScreen stepsScreen;
  late ChallengePresentationScreen presentationScreen;
  late ChallengeCompleteScreen completeScreen;

  @override
  initState() {
    challengeScreen = ChallengeScreen(acceptedChallenge);
    loadingScreen = LoadingScreen(finishedLoading);
    // initialize the rest of the screens + whole challenge in loadingScreen?
    upgradeScreen = ChallengeUpgradeScreen(choseUpgrade);
    stepsOverviewScreen = ChallengeStepsOverviewScreen(finishedStepsOverview);
    necessitiesScreen = ChallengeNecessitiesScreen(finishedNecessities);
    stepsScreen = StepsScreen(finishedSteps);
    presentationScreen = ChallengePresentationScreen(chosePresentation);
    completeScreen = ChallengeCompleteScreen(closeChallenge);
    super.initState();
  }

  // whole challenge state here too
  // for persistence: send timeSpent in callback in the Steps Screen

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

  finishedLoading() {
    setState(() {
      activeStep = 3;
    });
  }

  finishedStepsOverview() {
    setState(() {
      activeStep = 4;
    });
  }

  finishedNecessities() {
    setState(() {
      activeStep = 5;
    });
  }

  finishedSteps() {
    setState(() {
      activeStep = 6;
    });
  }

  chosePresentation() {
    setState(() {
      activeStep = 7;
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
        return loadingScreen;
      case 3:
        return stepsOverviewScreen;
      case 4:
        return necessitiesScreen;
      case 5:
        return stepsScreen;
      case 6:
        return presentationScreen;
      case 7:
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
