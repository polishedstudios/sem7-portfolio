import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage buildTransition({
  required Widget child,
}) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SlideTransition(
      position: Tween(begin: const Offset(0, 1), end: Offset.zero).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOutQuart,
          reverseCurve: Curves.easeInOutCubic,
        ),
      ),
      child: child,
    ),
    transitionDuration: const Duration(milliseconds: 700),
  );
}
