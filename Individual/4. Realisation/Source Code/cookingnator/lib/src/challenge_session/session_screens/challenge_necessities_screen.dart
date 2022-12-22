import 'package:flutter/material.dart';
import '../session_topbar.dart';
import '../../buttons/primary_button.dart';

class ChallengeNecessitiesScreen extends StatelessWidget {
  const ChallengeNecessitiesScreen(this.callback, {super.key});
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
                          constraints: const BoxConstraints(maxHeight: 250),
                          child: Image.asset(
                              'assets/challenges/CurryRice_Ingredients.png')),
                      const SizedBox(height: 30),
                      Expanded(
                        child: ListView(
                          children: [
                            mockRow(false, true, "400g onion"),
                            mockRow(true, true, "250g potato"),
                            mockRow(true, false, "100g carrot"),
                            mockRow(true, true, "1tbsp oil"),
                            mockRow(
                                true, false, "100g curry blocks or curry mix"),
                            mockRow(true, false, "800ml water"),
                            mockRow(true, true, "4 cups of rice"),
                          ],
                        ),
                      ),
                    ],
                  ), // rest in here
                ),
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

  Widget mockRow(bool divider, bool checked, String stepDescription) {
    return Column(
      children: [
        if (divider) ...{
          Divider(
            thickness: 1,
            height: 15,
            color: Colors.grey.shade300,
          ),
        },
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.scale(
              scale: 1.1,
              child: Checkbox(
                value: checked,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                activeColor: const Color(0xFFce82ff),
                onChanged: (bool? newValue) {}, //
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
        ),
      ],
    );
  }
}
