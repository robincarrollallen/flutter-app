import 'package:flutter/material.dart';

class RippleButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  final VoidCallback onLongPress;
  final double width;
  final double height;
  final Color backgroundColor;
  final Gradient? gradient;
  final Color rippleColor;
  final double borderRadius;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry? padding;
  final bool disabled;
  final double disabledOpacity;

  const RippleButton({
    super.key,
    this.child,
    this.onPressed,
    this.onLongPress = _defaultLongPress,
    this.width = double.infinity,
    this.height = 48,
    this.backgroundColor = Colors.transparent,
    this.gradient,
    this.rippleColor = Colors.white10,
    this.borderRadius = 6,
    this.border,
    this.boxShadow,
    this.padding,
    this.disabled = false,
    this.disabledOpacity = 0.5,
  });

  static void _defaultLongPress() {}

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);

    Widget button = Material(
      type: MaterialType.button,
      color: backgroundColor,
      borderRadius: radius,
      child: InkWell(
        splashColor: rippleColor,
        onTap: disabled ? null : onPressed,
        onLongPress: disabled ? _defaultLongPress : onLongPress,
        borderRadius: BorderRadius.circular(8.0),
        child: Ink(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: radius,
            border: border
          ),
          child: Center(
            child: child,
          )
        ),
      ),
    );

    // 添加阴影
    if (boxShadow != null) {
      button = Container(
        decoration: BoxDecoration(
          borderRadius: radius,
          boxShadow: boxShadow,
        ),
        child: button,
      );
    }

    // 禁用状态
    if (disabled) {
      button = Opacity(
        opacity: disabledOpacity,
        child: button,
      );
    }

    return button;
  }
}