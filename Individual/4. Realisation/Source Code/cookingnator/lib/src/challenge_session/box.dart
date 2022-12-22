import 'package:flutter/material.dart';

class StyleOfBox {
  final Color topColor;
  final Color backColor;
  final double? width;
  final double? height;
  final BorderRadius borderRadius;
  final double z;

  static const Color white = Color(0xFFFFFFFF);
  static const Color purple = Color(0xFFce82ff);

  const StyleOfBox({
    this.width,
    this.height,
    this.topColor = white,
    this.backColor = purple,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(18.0),
    ),
    this.z = 9.0,
  });
  // ignore: constant_identifier_names
  static const DEFAULT = StyleOfBox(
    topColor: white,
    backColor: purple,
  );
}

class Box extends StatefulWidget {
  final Widget child;
  final String text;
  final StyleOfBox style;
  final double width;
  final double height;

  const Box({
    required this.child,
    required this.text,
    this.style = StyleOfBox.DEFAULT,
    this.width = 100,
    this.height = 68,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => Box3DState();
}

class Box3DState extends State<Box> {
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
              offset: const Offset(0, 0),
            )
          ],
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(
            width: widget.width,
            height: widget.height - widget.style.z,
          ),
          child: Container(
            padding: EdgeInsets.zero,
            alignment: Alignment.topCenter,
            child: Text(
              widget.text.toUpperCase(),
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopLayout() {
    return Padding(
      padding: const EdgeInsets.only(top: 31),
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          border: Border.all(
            color: StyleOfBox.purple,
            width: 3,
          ),
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
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: <Widget>[_buildBackLayout(), _buildTopLayout()],
    );
  }
}
