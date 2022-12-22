import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:im_stepper/stepper.dart';

// ignore: must_be_immutable
class SessionTopBar extends StatefulWidget {
  SessionTopBar({this.stepAmount = 0, this.activeStep = 0, super.key});
  final int stepAmount;
  late int activeStep;

  static const Color purple = Color(0xFFce82ff);
  static const Color purpleDark = Color(0xFFa568cc);

  @override
  State<SessionTopBar> createState() => _SessionTopBar();
}

class _SessionTopBar extends State<SessionTopBar> {
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
          if (widget.stepAmount > 0) ...{
            DotStepper(
              dotCount: widget.stepAmount,
              dotRadius: 10,
              lineConnectorsEnabled: false,
              activeStep: widget.activeStep,
              shape: Shape.circle,
              spacing: 6,
              indicator: Indicator.jump,
              tappingEnabled: false,
              fixedDotDecoration: const FixedDotDecoration(
                color: SessionTopBar.purpleDark,
                strokeColor: Colors.white,
                strokeWidth: 7,
              ),
              indicatorDecoration: const IndicatorDecoration(
                color: SessionTopBar.purple,
              ),
            ),
          },
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
