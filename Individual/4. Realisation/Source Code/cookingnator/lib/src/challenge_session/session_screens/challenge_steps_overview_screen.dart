import 'package:flutter/material.dart';
import '../../challenge_selection/topbar/session_topbar.dart';
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
          const SessionTopBar(),
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 13,
                                    child: Text(
                                      '1',
                                      style: TextStyle(
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
                                      'assets/challenges/type-prep.png',
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Text(
                                    "Prepare ingredients",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 39, 38, 39),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                  thickness: 1,
                                  height: 14,
                                  color: Colors.grey.shade300),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 13,
                                    child: Text(
                                      '2',
                                      style: TextStyle(
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
                                      'assets/challenges/type-cook.png',
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Text(
                                    "Cook rice and set aside",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 39, 38, 39),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                  thickness: 1,
                                  height: 14,
                                  color: Colors.grey.shade300),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 13,
                                    child: Text(
                                      '3',
                                      style: TextStyle(
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
                                      'assets/challenges/type-cook.png',
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Text(
                                    "Sauté onion pieces",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 39, 38, 39),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                  thickness: 1,
                                  height: 14,
                                  color: Colors.grey.shade300),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 13,
                                    child: Text(
                                      '4',
                                      style: TextStyle(
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
                                      'assets/challenges/type-cook.png',
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Text(
                                    "Add potato and carrot pieces",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 39, 38, 39),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                  thickness: 1,
                                  height: 14,
                                  color: Colors.grey.shade300),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 13,
                                    child: Text(
                                      '5',
                                      style: TextStyle(
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
                                      'assets/challenges/type-cook.png',
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Text(
                                    "Add water and bring it to a boil",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 39, 38, 39),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                  thickness: 1,
                                  height: 14,
                                  color: Colors.grey.shade300),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 13,
                                    child: Text(
                                      '6',
                                      style: TextStyle(
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
                                      'assets/challenges/type-cook.png',
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Text(
                                    "Add curry roux and cook",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 39, 38, 39),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                  thickness: 1,
                                  height: 14,
                                  color: Colors.grey.shade300),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 13,
                                    child: Text(
                                      '7',
                                      style: TextStyle(
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
                                      'assets/challenges/type-presentation.png',
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Text(
                                    "Present your dish",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 39, 38, 39),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // has back button?
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
}
