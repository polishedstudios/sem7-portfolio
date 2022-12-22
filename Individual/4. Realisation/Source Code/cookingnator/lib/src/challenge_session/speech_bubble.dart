import 'package:flutter/material.dart';
import 'dart:math' as math;

enum BubbleDirection { top, bottom, right, left, none }

class BubblePosition {
  final double? start;
  final double? end;
  final double? center;

  const BubblePosition.start(this.start)
      : end = null,
        center = null;
  const BubblePosition.end(this.end)
      : start = null,
        center = null;
  const BubblePosition.center(this.center)
      : start = null,
        end = null;

  const BubblePosition._(this.start, this.end, this.center);

  operator *(double scale) {
    double? start;
    double? end;
    double? center;
    if (this.start != null) {
      start = this.start! * scale;
    }
    if (this.end != null) {
      end = this.end! * scale;
    }
    if (this.center != null) {
      center = this.center! * scale;
    }
    return BubblePosition._(start, end, center);
  }
}

enum BubbleBoxBorderStyle { none, solid, dashed }

class BubbleBoxBorder {
  final Color color;
  final double width;
  final BubbleBoxBorderStyle style;
  final double dashedWidth;
  final double? dashedGap;
  final Gradient? gradient;

  BubbleBoxBorder({
    this.color = const Color(0xFF000000),
    this.width = 1,
    this.style = BubbleBoxBorderStyle.solid,
    this.dashedGap,
    this.dashedWidth = 5,
    this.gradient,
  });

  BubbleBoxBorder scale(double t) {
    return BubbleBoxBorder(
      color: color,
      style: style,
      width: width * t,
      dashedGap: (dashedGap ?? dashedWidth) * t,
      gradient: gradient?.scale(t),
      dashedWidth: dashedWidth * t,
    );
  }
}

class BubbleShapeBorder extends ShapeBorder {
  final BubbleDirection direction;
  final double arrowHeight;
  final double arrowAngle;
  final double arrowQuadraticBezierLength;
  final BubblePosition position;
  final BubbleBoxBorder? border;
  final BorderRadius radius;
  final double smooth;

  BubbleShapeBorder({
    this.direction = BubbleDirection.none,
    this.arrowAngle = 6,
    this.arrowHeight = 6,
    this.position = const BubblePosition.center(0),
    this.border,
    this.arrowQuadraticBezierLength = 0,
    BorderRadius? radius,
    this.smooth = 1,
  }) : radius = radius ?? BorderRadius.circular(20.0);

  @override
  EdgeInsetsGeometry get dimensions {
    EdgeInsets margin;
    switch (direction) {
      case BubbleDirection.left:
        margin = EdgeInsets.only(left: arrowHeight);
        break;
      case BubbleDirection.top:
        margin = EdgeInsets.only(top: arrowHeight);
        break;
      case BubbleDirection.right:
        margin = EdgeInsets.only(right: arrowHeight);
        break;
      case BubbleDirection.bottom:
        margin = EdgeInsets.only(bottom: arrowHeight);
        break;
      default:
        margin = EdgeInsets.zero;
    }
    if (border != null && border!.style != BubbleBoxBorderStyle.none) {
      margin += EdgeInsets.all(border!.width / 2);
    }
    return margin;
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    var arrowQuadraticBezierLength =
        this.arrowQuadraticBezierLength > arrowHeight
            ? arrowHeight
            : this.arrowQuadraticBezierLength;

    Size size = Size(rect.width, rect.height);
    BorderRadius radius = _radius(size);
    var path = Path();
    double ah = arrowHeight;
    double leftMargin = 0, rightMargin = 0, topMargin = 0, bottomMargin = 0;

    if (direction == BubbleDirection.left) {
      leftMargin += ah;
    } else if (direction == BubbleDirection.top) {
      topMargin += ah;
    } else if (direction == BubbleDirection.right) {
      rightMargin += ah;
    } else if (direction == BubbleDirection.bottom) {
      bottomMargin += ah;
    }

    path.moveTo(
      leftMargin,
      topMargin +
          math.min(_min(position.start, radius.topLeft.y, BubbleDirection.left),
              size.height),
    );
    path.quadraticBezierTo(
      leftMargin,
      topMargin,
      leftMargin +
          math.min(_min(position.start, radius.topLeft.x, BubbleDirection.top),
              size.width),
      topMargin,
    );

    if (direction == BubbleDirection.top) {
      double p = _getTopBottomPosition(size);
      path.lineTo(p - arrowAngle - smooth, topMargin);
      var x = arrowAngle * arrowQuadraticBezierLength / ah;
      path.quadraticBezierTo(p - arrowAngle + smooth, topMargin, p - x,
          arrowQuadraticBezierLength);
      path.quadraticBezierTo(p, 0, p + x, arrowQuadraticBezierLength);
      path.quadraticBezierTo(p + arrowAngle - smooth, topMargin,
          p + arrowAngle + smooth, topMargin);
    }

    path.lineTo(
      size.width -
          rightMargin -
          math.min(_min(position.end, radius.topRight.x, BubbleDirection.top),
              size.width),
      topMargin,
    );
    path.quadraticBezierTo(
      size.width - rightMargin,
      topMargin,
      size.width - rightMargin,
      topMargin +
          math.min(
              _min(position.start, radius.topRight.y, BubbleDirection.right),
              size.height),
    );

    if (direction == BubbleDirection.right) {
      double p = _getLeftRightPosition(size);
      path.lineTo(size.width - rightMargin, p - arrowAngle - smooth);
      var x = ah * arrowQuadraticBezierLength / arrowAngle;
      path.quadraticBezierTo(size.width - rightMargin, p - arrowAngle + smooth,
          size.width - arrowQuadraticBezierLength, p - x);
      path.quadraticBezierTo(
          size.width, p, size.width - arrowQuadraticBezierLength, p + x);
      path.quadraticBezierTo(size.width - rightMargin, p + arrowAngle - smooth,
          size.width - rightMargin, p + arrowAngle + smooth);
    }

    path.lineTo(
      size.width - rightMargin,
      size.height -
          bottomMargin -
          math.min(
              _min(position.end, radius.bottomRight.y, BubbleDirection.right),
              size.height),
    );
    path.quadraticBezierTo(
        size.width - rightMargin,
        size.height - bottomMargin,
        size.width -
            rightMargin -
            math.min(
                _min(
                    position.end, radius.bottomRight.x, BubbleDirection.bottom),
                size.width),
        size.height - bottomMargin);

    if (direction == BubbleDirection.bottom) {
      double p = _getTopBottomPosition(size);
      path.lineTo(
          p + arrowAngle - rightMargin + smooth, size.height - bottomMargin);
      var x = arrowAngle * arrowQuadraticBezierLength / ah;
      path.quadraticBezierTo(
          p + arrowAngle - rightMargin - smooth,
          size.height - bottomMargin,
          p + x - rightMargin,
          size.height - arrowQuadraticBezierLength);
      path.quadraticBezierTo(p - rightMargin, size.height, p - rightMargin - x,
          size.height - arrowQuadraticBezierLength);
      path.quadraticBezierTo(
          p - arrowAngle - rightMargin + smooth,
          size.height - bottomMargin,
          p - arrowAngle - rightMargin - smooth,
          size.height - bottomMargin);
    }

    path.lineTo(
        leftMargin +
            math.min(
                _min(position.start, radius.bottomLeft.x,
                    BubbleDirection.bottom),
                size.width),
        size.height - bottomMargin);
    path.quadraticBezierTo(
      leftMargin,
      size.height - bottomMargin,
      leftMargin,
      size.height -
          bottomMargin -
          math.min(
              _min(position.end, radius.bottomLeft.y, BubbleDirection.left),
              size.height),
    );

    if (direction == BubbleDirection.left) {
      double p = _getLeftRightPosition(size);
      path.lineTo(leftMargin, p + arrowAngle + smooth);
      var x = ah * arrowQuadraticBezierLength / arrowAngle;
      path.quadraticBezierTo(leftMargin, p + arrowAngle - smooth,
          arrowQuadraticBezierLength, p + x);
      path.quadraticBezierTo(0, p, arrowQuadraticBezierLength, p - x);
      path.quadraticBezierTo(leftMargin, p - arrowAngle + smooth, leftMargin,
          p - arrowAngle - smooth);
    }

    path.lineTo(
        leftMargin,
        topMargin +
            math.min(
                _min(position.start, radius.topRight.y, BubbleDirection.left),
                size.height));
    path = path.shift(rect.topLeft);
    path.close();
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (border != null && border!.style != BubbleBoxBorderStyle.none) {
      Path path = getOuterPath(rect);
      canvas.drawPath(
          path,
          Paint()
            ..shader = border?.gradient?.createShader(rect)
            ..isAntiAlias = true
            ..color = border!.color
            ..strokeWidth = border!.width
            ..style = PaintingStyle.stroke);
    }
  }

  @override
  ShapeBorder scale(double t) {
    return copyWith(
      radius: radius * t,
      border: border?.scale(t),
      smooth: smooth * t,
      arrowAngle: arrowAngle * t,
      arrowHeight: arrowHeight * t,
      arrowQuadraticBezierLength: arrowQuadraticBezierLength * t,
      position: position * t,
    );
  }

  double _getLeftRightPosition(Size size) {
    double p = size.height / 2;
    if (position.start != null) {
      p = position.start! + arrowAngle;
    } else if (position.end != null) {
      p = size.height - arrowAngle - position.end!;
    } else if (position.center != null) {
      p = p + position.center!;
    }
    assert(p >= arrowAngle && p <= size.height - arrowAngle);
    return p;
  }

  double _getTopBottomPosition(Size size) {
    double p = size.width / 2;
    if (position.start != null) {
      p = position.start! + arrowAngle;
    } else if (position.end != null) {
      p = size.width - position.end! - arrowAngle;
    } else if (position.center != null) {
      p = p + position.center!;
    }
    assert(p >= arrowAngle && p <= size.width - arrowAngle);
    return p;
  }

  double _min(double? v1, double v2, BubbleDirection direction) {
    if (this.direction != direction) {
      return v2;
    }
    if (v1 == null) {
      return v2;
    }
    return math.min(v1, v2);
  }

  BorderRadius _radius(Size size) {
    double topLeftX = 0,
        topLeftY = 0,
        topRightX = 0,
        topRightY = 0,
        bottomLeftX = 0,
        bottomLeftY = 0,
        bottomRightX = 0,
        bottomRightY = 0;
    switch (direction) {
      case BubbleDirection.left:
        topLeftY =
            size.height - _getLeftRightPosition(size) - arrowAngle / 2 + smooth;
        bottomLeftY = _getLeftRightPosition(size) - arrowAngle / 2 + smooth;
        break;
      case BubbleDirection.right:
        topRightY =
            size.height - _getLeftRightPosition(size) - arrowAngle / 2 + smooth;
        bottomRightY = _getLeftRightPosition(size) - arrowAngle / 2 + smooth;
        break;
      case BubbleDirection.top:
        topLeftX =
            size.width - _getTopBottomPosition(size) - arrowAngle / 2 + smooth;
        topRightX = _getTopBottomPosition(size) - arrowAngle / 2 + smooth;
        break;
      case BubbleDirection.bottom:
        bottomLeftX =
            size.width - _getTopBottomPosition(size) - arrowAngle / 2 + smooth;
        bottomRightX = _getTopBottomPosition(size) - arrowAngle / 2 + smooth;
        break;
      default:
    }
    BorderRadius borderRadius = radius.copyWith(
      topLeft: Radius.elliptical(
        _s(radius.topLeft.x, radius.topRight.x, size.width - topLeftX),
        _s(radius.topLeft.y, radius.bottomLeft.y, size.height - topLeftY),
      ),
      topRight: Radius.elliptical(
        _s(radius.topRight.x, radius.topLeft.x, size.width - topRightX),
        _s(radius.topRight.y, radius.bottomRight.y, size.height - topRightY),
      ),
      bottomLeft: Radius.elliptical(
        _s(radius.bottomLeft.x, radius.bottomRight.x, size.width - bottomLeftX),
        _s(radius.bottomLeft.y, radius.topLeft.y, size.height - bottomLeftY),
      ),
      bottomRight: Radius.elliptical(
        _s(radius.bottomRight.x, radius.bottomLeft.x,
            size.width - bottomRightX),
        _s(radius.bottomRight.y, radius.topRight.y, size.height - bottomRightY),
      ),
    );
    return borderRadius;
  }

  double _s(double s1, double s2, double length) {
    return math.min(math.min(s1, s1 / (s1 + s2) * length), length);
  }

  BubbleShapeBorder copyWith({
    final BubbleDirection? direction,
    final double? arrowHeight,
    final double? arrowAngle,
    final double? arrowQuadraticBezierLength,
    final BubblePosition? position,
    final BubbleBoxBorder? border,
    final BorderRadius? radius,
    final double? smooth,
    final double? dashedWidth,
    final double? dashedGap,
    final Gradient? gradient,
  }) {
    return BubbleShapeBorder(
      direction: direction ?? this.direction,
      arrowHeight: arrowHeight ?? this.arrowHeight,
      arrowAngle: arrowAngle ?? this.arrowAngle,
      arrowQuadraticBezierLength:
          arrowQuadraticBezierLength ?? this.arrowQuadraticBezierLength,
      position: position ?? this.position,
      border: border ?? this.border,
      radius: radius ?? this.radius,
      smooth: smooth ?? this.smooth,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BubbleShapeBorder &&
          runtimeType == other.runtimeType &&
          direction == other.direction &&
          arrowHeight == other.arrowHeight &&
          arrowAngle == other.arrowAngle &&
          arrowQuadraticBezierLength == other.arrowQuadraticBezierLength &&
          position == other.position &&
          border == other.border &&
          radius == other.radius &&
          smooth == other.smooth;

  @override
  int get hashCode =>
      direction.hashCode ^
      arrowHeight.hashCode ^
      arrowAngle.hashCode ^
      arrowQuadraticBezierLength.hashCode ^
      position.hashCode ^
      border.hashCode ^
      radius.hashCode ^
      smooth.hashCode;
}

class BubbleBox extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final double? maxWidth;
  final double? maxHeight;
  final double? widthFactor;
  final double? heightFactor;
  final double elevation;
  final Color? shadowColor;
  final Gradient? gradient;
  final BlendMode blendMode;
  final ShapeBorder? shape;

  BubbleBox({
    Key? key,
    required this.child,
    this.backgroundColor,
    this.maxWidth,
    this.maxHeight,
    this.widthFactor,
    this.heightFactor,
    this.elevation = 0.0,
    this.shadowColor,
    this.gradient,
    this.blendMode = BlendMode.dstATop,
    this.margin,
    this.padding = const EdgeInsets.all(8),
    ShapeBorder? shape,
  })  : shape = shape ?? BubbleShapeBorder(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget current = Container(
      padding: padding.add(shape?.dimensions ?? EdgeInsets.zero),
      color: Colors.transparent,
      child: child,
    );
    if (gradient != null) {
      current = ShaderMask(
        shaderCallback: (Rect rect) {
          return gradient!.createShader(rect);
        },
        blendMode: blendMode,
        child: current,
      );
    }
    current = Material(
      shape: shape,
      clipBehavior: Clip.antiAlias,
      color: backgroundColor,
      shadowColor: shadowColor,
      elevation: elevation,
      child: current,
    );
    if (margin != null) {
      current = Padding(
        padding: margin!,
        child: current,
      );
    }
    if (maxWidth != null || maxHeight != null) {
      current = LimitedBox(
        maxWidth: maxWidth ?? double.infinity,
        maxHeight: maxHeight ?? double.infinity,
        child: current,
      );
    }
    if (widthFactor != null || heightFactor != null) {
      current = FractionallySizedBox(
        widthFactor: widthFactor ?? 1,
        heightFactor: heightFactor ?? 1,
        child: current,
      );
    }
    return current;
  }
}
