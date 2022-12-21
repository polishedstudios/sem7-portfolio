import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/src/style/palette.dart';

class SelectionTopBar extends StatelessWidget {
  SelectionTopBar({super.key});
  final Palette palette = Palette();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: kIsWeb ? 64 : 84,
          color: palette.colorMain,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4, 0, 6, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  rowItemMain(
                    'assets/flag_jp.png',
                    () {}, // onPressed
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      rowItem(
                        'assets/streak.svg',
                        "2",
                        () {}, // onPressed
                      ),
                      const SizedBox(width: 10),
                      rowItem(
                        'assets/gem.svg',
                        "0",
                        () {}, // onPressed
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Divider(
          height: 3,
          thickness: 3,
          color: palette.colorMainDark,
        ),
      ],
    );
  }

  Widget rowItemMain(icon, onPressed) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Image(image: AssetImage(icon))],
      ),
    );
  }

  Widget rowItem(icon, text, onPressed) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(icon),
          if (text != null) ...{
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          },
        ],
      ),
    );
  }
}
