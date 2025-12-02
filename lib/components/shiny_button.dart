import 'package:flutter/material.dart';
import 'dart:math' as math;

class ShinyButton extends StatefulWidget {
  /// 按钮上显示的子组件，通常是 Text。
  final Widget child;

  final bool shiny;

  /// 按钮的背景颜色。
  final Color color;

  /// 扫光效果的颜色。
  final Color shineColor;

  /// 按钮的点击回调。
  final VoidCallback? onPressed;

  /// 扫光动画的周期，默认为3秒。
  final Duration duration;

  /// 按钮的圆角。
  final BorderRadius borderRadius;

  /// 按钮的内边距。
  final EdgeInsetsGeometry padding;

  const ShinyButton({
    super.key,
    required this.child,
    this.onPressed,
    this.shiny = false,
    this.color = Colors.transparent, // 默认蓝色背景
    this.shineColor = Colors.white,
    this.duration = const Duration(seconds: 3), // 缩短周期以获得更快的扫光效果
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  });

  @override
  State<ShinyButton> createState() => _ShinyButtonState();
}

class _ShinyButtonState extends State<ShinyButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    // 缩放动画：从 1.0 放大到 4.0
    _scaleAnimation = Tween<double>(begin: 1.0, end: 15.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // 透明度动画：从 0.5 (初始可见) 到 0.0 (完全透明)
    _fadeAnimation = Tween<double>(begin: 0.5, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.repeat(); // 无限重复动画
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.color,
      borderRadius: widget.borderRadius,
      child: InkWell(
        onTap: widget.onPressed,
        borderRadius: widget.borderRadius,
        child: ClipRRect(
          borderRadius: widget.borderRadius,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              // 按钮内容
              Padding(
                padding: widget.padding,
                child: Center(
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    child: widget.child,
                  ),
                ),
              ),
              widget.shiny ? Positioned.fill(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final buttonSize = constraints.biggest;
                    return AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.translate(
                          offset:Offset(-buttonSize.width, 0),
                          child: Opacity(
                            opacity: _fadeAnimation.value,
                            child: Transform.scale(
                              scale: _scaleAnimation.value,
                              child: Transform.rotate(
                                angle: -45 * math.pi / 180,
                                child: Container(
                                  width: buttonSize.width,
                                  height: buttonSize.width, // 创建一个正方形
                                  color: widget.shineColor,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                )
              ) : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}