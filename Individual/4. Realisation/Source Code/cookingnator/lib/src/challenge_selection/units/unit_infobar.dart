import 'package:flutter/material.dart';
import '/src/style/palette.dart';

class UnitInfoBar extends StatelessWidget {
  UnitInfoBar(this.unitNumer, this.description, {super.key});
  final Palette palette = Palette();
  final int unitNumer;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 13, 15, 17),
      margin: const EdgeInsets.only(bottom: 15),
      color: palette.colorMain,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Unit $unitNumer",
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          Text(
            description,
            style: const TextStyle(fontSize: 20, height: 1.1),
          ),
        ],
      ),
    );
  }
}
