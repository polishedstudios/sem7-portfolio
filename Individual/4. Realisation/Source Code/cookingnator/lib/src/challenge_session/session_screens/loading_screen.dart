import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen(this.callback, {super.key});
  final Function callback;

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 2400),
      (() async {
        callback();
      }),
    );

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
