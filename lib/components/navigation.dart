import 'package:flutter/material.dart';
import 'package:flutter_app/utils/screen.dart';

class Navigation extends StatefulWidget {
  final Widget? prefix;
  final Widget? title;
  final Widget? content;
  final Widget? suffix;
  final bool arrow;
  final VoidCallback? onPressed; // 按钮的点击回调。

  const Navigation({
    super.key,
    this.prefix,
    this.title,
    this.content,
    this.suffix,
    this.arrow = true,
    this.onPressed,
  });

  @override
  State<Navigation> createState() => _GradientProgressBarState();
}

class _GradientProgressBarState extends State<Navigation> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      behavior: HitTestBehavior.translucent, // 点击空白区域也生效
      onTap: widget.onPressed,
      child: Row(
        spacing: 12.0.rem(),
        children: [
          ?widget.prefix,
          ?widget.title,
          Expanded(child: widget.content ?? Container()),
          widget.arrow ? Icon(Icons.keyboard_arrow_right) : widget.suffix ?? Container(),
        ],
      )
    );
  }
}