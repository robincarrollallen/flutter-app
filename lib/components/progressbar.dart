import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  final double progress; // 进度值 0.0 ~ 1.0

  final double height; // 进度条高度

  final Color backgroundColor; // 背景颜色

  final Color? progressColor; // 进度条颜色（单色时使用）

  final Gradient? gradient; // 渐变色（优先级高于 progressColor

  final BorderRadius? borderRadius; // 圆角

  final Duration duration; // 动画时长

  final Curve curve; // 动画曲线

  final bool animated; // 是否启用动画

  const ProgressBar({
    super.key,
    this.progress = 0,
    this.height = 8,
    this.backgroundColor = Colors.white24,
    this.progressColor,
    this.gradient,
    this.borderRadius,
    this.duration = const Duration(milliseconds: 800),
    this.curve = Curves.easeOutCubic,
    this.animated = true,
  });

  @override
  State<ProgressBar> createState() => _GradientProgressBarState();
}

class _GradientProgressBarState extends State<ProgressBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _oldProgress = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _setupAnimation();

    if (widget.animated) {
      _controller.forward();
    }
  }

  void _setupAnimation() {
    _animation = Tween<double>(
      begin: widget.animated ? 0 : widget.progress,
      end: widget.progress,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));
  }

  @override
  void didUpdateWidget(ProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progress != widget.progress) {
      _oldProgress = _animation.value;
      _animation = Tween<double>(
        begin: _oldProgress,
        end: widget.progress,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ));
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final radius = widget.borderRadius ?? BorderRadius.circular(widget.height / 2);

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: double.infinity,
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? Colors.grey[300],
            borderRadius: radius,
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: _animation.value.clamp(0.0, 1.0),
            child: Container(
              decoration: BoxDecoration(
                color: widget.gradient == null ? (widget.progressColor ?? Colors.blue) : null,
                gradient: widget.gradient,
                borderRadius: radius,
              ),
            ),
          ),
        );
      },
    );
  }
}