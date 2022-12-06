import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/src/style/palette.dart';

class TopBar extends StatelessWidget {
  TopBar({super.key});
  final Palette palette = Palette();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 84,
          color: palette.colorMain,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4, 0, 6, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  rowItemMain(
                    'https://i.imgur.com/WPaUdx4.png',
                    () {}, // onPressed
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      rowItem(
                        'https://d35aaqx5ub95lt.cloudfront.net/vendor/398e4298a3b39ce566050e5c041949ef.svg',
                        "2",
                        () {}, // onPressed
                      ),
                      const SizedBox(width: 10),
                      rowItem(
                        'https://d35aaqx5ub95lt.cloudfront.net/vendor/aed279fcbad509208b45ca7a17f3e8dc.svg',
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

  Widget rowItemMain(text, onPressed) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Image.network(text)],
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
          SvgPicture.network(
            icon,
          ),
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
