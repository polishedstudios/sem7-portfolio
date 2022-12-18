import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SessionTopBar extends StatelessWidget {
  const SessionTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).go('/');
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
