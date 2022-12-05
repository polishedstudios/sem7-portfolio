import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChallengeSessionScreen extends StatelessWidget {
  const ChallengeSessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Level Session"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Hello'),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/');
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
