import 'package:flutter/material.dart';

class StyleOfPressButton {
  final Color topColor;
  final Color backColor;
  final double? width;
  final double? height;
  final BorderRadius borderRadius;
  final double z;
  final double tapped;

  static const Color purple = Color(0xFFce82ff);
  static const Color purpleDark = Color(0xFFa568cc);

  const StyleOfPressButton({
    this.width,
    this.height,
    this.topColor = purple,
    this.backColor = purpleDark,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(55.0),
    ),
    this.z = 9.0,
    this.tapped = 3,
  });
  // ignore: constant_identifier_names
  static const DEFAULT = StyleOfPressButton(
    topColor: purple,
    backColor: purpleDark,
  );
}

class PressButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  final StyleOfPressButton style;
  final double width;
  final double height;

  const PressButton({
    required this.onPressed,
    required this.child,
    this.style = StyleOfPressButton.DEFAULT,
    this.width = 75,
    this.height = 75,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => Button3DState();
}

class Button3DState extends State<PressButton> {
  bool isTapped = false;

  Widget _buildBackLayout() {
    return Padding(
      padding: EdgeInsets.only(top: widget.style.z),
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          borderRadius: widget.style.borderRadius,
          boxShadow: [
            BoxShadow(
              color: widget.style.backColor,
              offset: const Offset(1, 0),
            )
          ],
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(
            width: widget.width,
            height: widget.height - widget.style.z,
          ),
        ),
      ),
    );
  }

  Widget _buildTopLayout() {
    return Padding(
      padding: EdgeInsets.only(
        top: isTapped ? widget.style.z - widget.style.tapped : 3,
      ),
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          borderRadius: widget.style.borderRadius,
          boxShadow: [
            BoxShadow(
              color: widget.style.topColor,
            ),
          ],
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(
            width: widget.width,
            height: widget.height - widget.style.z,
          ),
          child: Container(
            padding: EdgeInsets.zero,
            alignment: Alignment.center,
            child: widget.child,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[_buildBackLayout(), _buildTopLayout()],
      ),
      onTapDown: (TapDownDetails event) {
        setState(() {
          isTapped = true;
        });
      },
      onTapCancel: () {
        setState(() {
          isTapped = false;
        });
      },
      onTapUp: (TapUpDetails event) {
        setState(() {
          isTapped = false;
        });
        widget.onPressed();
      },
    );
  }
}
