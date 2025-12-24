import 'package:flutter/material.dart';

class RippleButton extends StatelessWidget {
  final Widget? child;
  final String? text;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final double? width;
  final double height;
  final Color? backgroundColor;
  final Gradient? gradient;
  final Color? rippleColor;
  final double borderRadius;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry? padding;
  final bool disabled;
  final double disabledOpacity;

  const RippleButton({
    super.key,
    this.child,
    this.text,
    this.textStyle,
    this.onPressed,
    this.onLongPress,
    this.width,
    this.height = 48,
    this.backgroundColor,
    this.gradient,
    this.rippleColor,
    this.borderRadius = 8,
    this.border,
    this.boxShadow,
    this.padding,
    this.disabled = false,
    this.disabledOpacity = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);
    final effectiveRippleColor = rippleColor ?? Colors.white.withValues(alpha: 0.3);
    final bgColor = backgroundColor ?? Colors.blue;

    Widget button = Material(
      color: gradient == null ? bgColor : Colors.transparent,
      borderRadius: radius,
      type: gradient != null ? MaterialType.transparency : MaterialType.button,
      child: InkWell(
        onTap: disabled ? null : onPressed,
        onLongPress: disabled ? null : onLongPress,
        borderRadius: radius,
        splashColor: effectiveRippleColor,
        highlightColor: effectiveRippleColor.withValues(alpha: 0.15),
        splashFactory: InkRipple.splashFactory, // 确保使用波纹效果
        child: Container(
          width: width ?? double.infinity,
          height: height,
          padding: padding ?? EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: radius,
            border: border,
          ),
          alignment: Alignment.center,
          child: child ?? _buildDefaultChild(),
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

  Widget? _buildDefaultChild() {
    if (text == null) return null;
    return Text(
      text!,
      style: textStyle ??
          TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
    );
  }
}