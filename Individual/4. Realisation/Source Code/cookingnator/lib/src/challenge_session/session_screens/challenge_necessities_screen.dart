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
                        // child: Image.asset(
                        //     'assets/challenges/mawaru-penguindrum-2.gif'),
                        child: Image.network(
                          'https://assets.epicurious.com/photos/587668a6e8515df0310ca8b8/6:4/w_1600%2Cc_limit/japanese-curry-inset-06012017.jpg',
                        ),
                      ),
                      const SizedBox(height: 30),
                      Expanded(
                        child: ListView(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Transform.scale(
                                  scale: 1.1,
                                  child: Checkbox(
                                    value: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    activeColor: const Color(0xFFce82ff),
                                    onChanged: (bool? newValue) {},
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  "400g onion",
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
                              color: Colors.grey.shade300,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Transform.scale(
                                  scale: 1.1,
                                  child: Checkbox(
                                    value: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    activeColor: const Color(0xFFce82ff),
                                    onChanged: (bool? newValue) {},
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  "250g potato",
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
                              color: Colors.grey.shade300,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Transform.scale(
                                  scale: 1.1,
                                  child: Checkbox(
                                    value: false,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    activeColor: const Color(0xFFce82ff),
                                    onChanged: (bool? newValue) {},
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  "100g carrot",
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
                              color: Colors.grey.shade300,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Transform.scale(
                                  scale: 1.1,
                                  child: Checkbox(
                                    value: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    activeColor: const Color(0xFFce82ff),
                                    onChanged: (bool? newValue) {},
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  "1tbsp oil",
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
                              color: Colors.grey.shade300,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Transform.scale(
                                  scale: 1.1,
                                  child: Checkbox(
                                    value: false,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    activeColor: const Color(0xFFce82ff),
                                    onChanged: (bool? newValue) {},
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  "100g curry blocks or curry mix",
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
                              color: Colors.grey.shade300,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Transform.scale(
                                  scale: 1.1,
                                  child: Checkbox(
                                    value: false,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    activeColor: const Color(0xFFce82ff),
                                    onChanged: (bool? newValue) {},
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  "800ml water",
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
                              color: Colors.grey.shade300,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Transform.scale(
                                  scale: 1.1,
                                  child: Checkbox(
                                    value: false,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    activeColor: const Color(0xFFce82ff),
                                    onChanged: (bool? newValue) {},
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  "4 cups of rice",
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
}
