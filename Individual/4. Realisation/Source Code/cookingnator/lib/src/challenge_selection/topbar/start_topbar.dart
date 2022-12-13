import 'package:flutter/material.dart';

class StartTopBar extends StatelessWidget {
  const StartTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.maybePop(context);
            },
            color: Colors.grey.shade600,
            iconSize: 32,
            icon: const Icon(Icons.close_rounded),
          ),
          IconButton(
            onPressed: () {},
            color: Colors.red,
            iconSize: 30,
            icon: const Icon(Icons.favorite_rounded),
          ),
        ],
      ),
    );
  }
}
