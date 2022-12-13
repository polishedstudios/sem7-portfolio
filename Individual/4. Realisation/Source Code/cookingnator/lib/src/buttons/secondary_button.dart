import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(this.text, this.onPressed, {super.key});
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontFamily: 'Baloo2',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xFFce82ff),
        ),
      ),
    );
  }
}
