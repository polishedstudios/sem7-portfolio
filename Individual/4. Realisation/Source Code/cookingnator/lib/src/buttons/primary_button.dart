import 'package:flutter/material.dart';
import 'press_button.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(this.text, this.onPressed, {super.key});
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return PressButton(
      onPressed: () => onPressed(),
      width: double.infinity,
      height: 65,
      style: const StyleOfPressButton(
          borderRadius: BorderRadius.all(Radius.circular(19.0))),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
