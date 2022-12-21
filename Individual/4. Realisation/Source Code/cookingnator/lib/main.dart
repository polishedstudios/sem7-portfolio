import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'src/style/palette.dart';
import 'src/style/transition.dart';

import 'src/app_lifecycle/app_lifecycle.dart';
import 'src/challenge_selection/challenge_selection_screen.dart';
import 'src/challenge_session/challenge_session_screen.dart';

void main() {
  runApp(const MyApp());

  // runApp(
  //   MyApp(
  //     playerProgressPersistence: LocalStoragePlayerProgressPersistence(),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
            const ChallengeSelectionScreen(key: Key('challenge selection')),
        routes: [
          GoRoute(
            path: 'session',
            builder: (context, state) =>
                const ChallengeSessionScreen(key: Key('challenge session')),
            pageBuilder: (context, state) => buildTransition(
              child:
                  const ChallengeSessionScreen(key: Key('challenge session')),
            ),
          ),
        ],
      ),
    ],
  );

  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppLifecycleObserver(
      child: MultiProvider(
        providers: [
          // providers persistence etc.
          Provider(
            create: (context) => Palette(),
          ),
        ],
        child: Builder(builder: (context) {
          final palette = context.watch<Palette>();

          return MaterialApp.router(
            title: 'Flutter Demo',
            theme: ThemeData.from(
              colorScheme: ColorScheme.fromSeed(
                seedColor: palette.colorMain,
                background: palette.backgroundMain,
                primary: palette.ink,
              ),
              textTheme: TextTheme(
                bodyMedium: TextStyle(
                  color: palette.ink,
                ),
              ).apply(fontFamily: 'Baloo2'),
            ),
            routeInformationProvider: _router.routeInformationProvider,
            routeInformationParser: _router.routeInformationParser,
            routerDelegate: _router.routerDelegate,
            // scaffoldMessengerKey: scaffoldMessengerKey,
          );
        }),
      ),
    );
  }
}
