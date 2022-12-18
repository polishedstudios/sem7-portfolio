import 'package:flutter/material.dart';
import 'press_button.dart';

class ImageButton extends StatelessWidget {
  const ImageButton(this.image, this.text, this.onPressed, {super.key});
  final String image;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return PressButton(
      onPressed: () => onPressed(),
      width: 175,
      height: 230,
      style: const StyleOfPressButton(
          borderRadius: BorderRadius.all(Radius.circular(19.0))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            const SizedBox(height: 5),
            Text(
              text.toUpperCase(),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "+1 ",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Image.asset(
                  'assets/challenges/difficulty_1_jp.png',
                  width: 38,
                  height: 38,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
