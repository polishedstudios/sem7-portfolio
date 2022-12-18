import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialPageRoute(builder: (context) => const LoadingScreen()),

    // Future.delayed(
    //   const Duration(seconds: 2),
    //   (() async {
    //     // Future.delayed(
    //     //     const Duration(seconds: 2), () => GoRouter.of(context).pop());
    //     GoRouter.of(context).go('/play');
    //     // await Future.delayed(Duration(seconds: 2));
    //     // GoRouter.of(context).pop();
    //     // GoRouter.of(context).pop();
    //   }),
    // );

    return Scaffold(
      backgroundColor: const Color(0xFFcd82ff),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Image(
              image: AssetImage('assets/loading_indicator.gif'),
              width: 180,
            ),
            SizedBox(height: 5),
            Text(
              'Preparing...',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
