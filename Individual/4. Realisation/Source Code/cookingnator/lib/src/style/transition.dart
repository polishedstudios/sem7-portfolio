import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage<T> buildTransition<T>({
  required Widget child,
  required Color color,
  String? name,
  Object? arguments,
  String? restorationId,
  LocalKey? key,
}) {
  return CustomTransitionPage<T>(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return _MyReveal(
        animation: animation,
        color: color,
        child: child,
      );
    },
    key: key,
    name: name,
    arguments: arguments,
    restorationId: restorationId,
    transitionDuration: const Duration(milliseconds: 550),
  );
}

class _MyReveal extends StatefulWidget {
  final Widget child;

  final Animation<double> animation;

  final Color color;

  const _MyReveal({
    required this.child,
    required this.animation,
    required this.color,
  });

  @override
  State<_MyReveal> createState() => _MyRevealState();
}

class _MyRevealState extends State<_MyReveal> {
  bool _finished = false;

  final _tween = Tween(begin: const Offset(0, 1), end: Offset.zero);

  @override
  void initState() {
    super.initState();

    widget.animation.addStatusListener(_statusListener);
  }

  @override
  void didUpdateWidget(covariant _MyReveal oldWidget) {
    if (oldWidget.animation != widget.animation) {
      oldWidget.animation.removeStatusListener(_statusListener);
      widget.animation.addStatusListener(_statusListener);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.animation.removeStatusListener(_statusListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SlideTransition(
          position: _tween.animate(
            CurvedAnimation(
              parent: widget.animation,
              curve: Curves.easeInOutQuart,
              reverseCurve: Curves.easeOutCirc,
            ),
          ),
          child: Container(
            color: widget.color,
          ),
        ),
        AnimatedOpacity(
          opacity: _finished ? 1 : 0,
          duration: const Duration(milliseconds: 250),
          child: widget.child,
        ),
      ],
    );
  }

  void _statusListener(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.completed:
        setState(() {
          _finished = true;
        });
        break;
      case AnimationStatus.forward:
      case AnimationStatus.dismissed:
      case AnimationStatus.reverse:
        setState(() {
          _finished = false;
        });
        break;
    }
  }
}
