import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import '/theme/variables/custom.dart';
import '/utils/screen.dart';

class MarqueeView extends StatelessWidget {
  const MarqueeView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>();

    final texts = [
      "第一条示例文本 — 从右向左滚动",
      "第二条：这是一个比较长的跑马灯文本，用来测试长度",
      "短句",
      "最后一条，循环播放",
    ];

    return Padding(
      padding: EdgeInsets.all(12.0.rem()),
      child: Row(
        spacing: 10.0.rem(),
        children: [
          Expanded(
            child: Container(
              height: 38.rem(),
              padding: EdgeInsets.symmetric(horizontal: 10.0.rem()),
              decoration: BoxDecoration(
                color: colors?.surfaceRaisedL2,
                borderRadius: BorderRadius.circular(6.0.rem()),
                border: Border.all( // 边框
                  color: colors?.borderDefault ?? Colors.transparent,
                  width: 1.0,
                ),
              ),
              child: Row(
                spacing: 10.0.rem(),
                children: [
                  Image.asset(
                    'assets/icons/home/broadcast-25.webp',
                    width: 20.rem(),
                    height: 20.rem(),
                  ),
                  Expanded(
                    child: MarqueeText(
                      texts: texts,
                      textStyle: TextStyle(fontSize: 14, color: colors?.iconBrandPrimary),
                      autoScroll: true,
                      speed: 80,
                      loop: true,
                      gap: 20,
                    ),
                  )
                ],
              )
            )
          ),
          Container(
            width: 38.rem(),
            height: 38.rem(),
            decoration: BoxDecoration(
              color: colors?.surfaceRaisedL2,
              borderRadius: BorderRadius.circular(6.0.rem()),
              border: Border.all( // 边框
                color: colors?.borderDefault ?? Colors.transparent,
                width: 1.0,
              ),
            ),
            child: Icon(
              Icons.search,
              color: colors?.iconBrandPrimary,
            ),
          )
        ],
      )
    );
  }
}

/// MarqueeText: 支持文本数组，上一条完全滚出后再开始下一条，自动滚动开关
class MarqueeText extends StatefulWidget {
  final List<String> texts;
  final TextStyle textStyle;
  final bool autoScroll;
  final double speed; // 像素/秒
  final bool loop; // 是否循环
  final double gap; // 两条文本间的额外间距（像素）

  const MarqueeText({
    super.key,
    required this.texts,
    this.textStyle = const TextStyle(fontSize: 14),
    this.autoScroll = true,
    this.speed = 50.0,
    this.loop = true,
    this.gap = 0.0,
  });

  @override
  State<MarqueeText> createState() => _MarqueeTextState();
}

class _MarqueeTextState extends State<MarqueeText>
  with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _index = 0;
  double _textWidth = 0;
  double _containerWidth = 0;
  bool _isRunning = false;
  Timer? _delayedStart;

  @override
  void initState() {
    super.initState();
    // controller value goes 0.0 -> 1.0 for each item
    _controller = AnimationController(vsync: this)
      ..addStatusListener(_handleStatus);
  }

  @override
  void dispose() {
    _delayedStart?.cancel();
    _controller.removeStatusListener(_handleStatus);
    _controller.dispose();
    super.dispose();
  }

  void _handleStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      // 当前文本完全滚出（controller到1.0），切到下一条
      _controller.stop();
      _controller.value = 0.0;
      _nextIndexAndMaybeStart();
    }
  }

  void _nextIndexAndMaybeStart() {
    final next = _index + 1;
    if (next >= widget.texts.length) {
      if (widget.loop) {
        _index = 0;
      } else {
        _isRunning = false;
        setState(() {});
        return;
      }
    } else {
      _index = next;
    }
    // small micro delay to allow any layout changes - not required but safer
    _delayedStart?.cancel();
    _delayedStart = Timer(Duration(milliseconds: 50), () {
      if (mounted && widget.autoScroll) _startAnimationForCurrent();
    });
    setState(() {});
  }

  void _startAnimationForCurrent() {
    if (!mounted) return;
    final text = widget.texts[_index];
    _textWidth = _measureTextWidth(text, widget.textStyle);
    // distance = containerWidth + textWidth
    final distance = (_containerWidth) + _textWidth + widget.gap;
    // avoid zero-size issues
    final speed = widget.speed <= 0 ? 50.0 : widget.speed;
    final durationMs = (distance / speed * 1000).round();
    // configure controller
    _controller.stop();
    _controller.duration = Duration(milliseconds: durationMs.clamp(200, 60000));
    // start from 0 -> 1
    _isRunning = true;
    _controller.value = 0.0;
    _controller.forward();
    setState(() {});
  }

  /// 手动开始（若 autoScroll = false，也可用）
  void start() {
    if (!_isRunning && mounted) {
      _startAnimationForCurrent();
    }
  }

  /// 手动停止并保持当前位置
  void stop() {
    _controller.stop();
    _isRunning = false;
    setState(() {});
  }

  double _measureTextWidth(String text, TextStyle style) {
    final tp = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    );
    tp.layout(); // 不传宽度限制，得到文字的天然宽度
    return tp.width;
  }

  @override
  Widget build(BuildContext context) {
    // Outer layout to get available width
    return LayoutBuilder(builder: (context, constraints) {
      final cw = constraints.maxWidth.isFinite ? constraints.maxWidth : 0.0;
      // if container width changed, update and optionally restart
      if (cw != _containerWidth) {
        _containerWidth = cw;
        // if currently running, recompute durations and restart
        if (widget.autoScroll && _isRunning) {
          _startAnimationForCurrent();
        }
      }

      final currentText = widget.texts.isNotEmpty
          ? widget.texts[_index % widget.texts.length]
          : '';

      // compute text width if unknown or changed
      if (_textWidth == 0 && currentText.isNotEmpty) {
        _textWidth = _measureTextWidth(currentText, widget.textStyle);
      }

      // When not running and autoScroll enabled, kick off
      if (!_isRunning && widget.autoScroll && currentText.isNotEmpty) {
        // small deferred start to make sure layout settled
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted && !_isRunning && widget.autoScroll) {
            _startAnimationForCurrent();
          }
        });
      }

      // If there's no text or 0 width, just show empty container
      if (currentText.isEmpty) return const SizedBox.shrink();

      return ClipRect(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            // controller.value: 0.0 -> 1.0
            // translate x from +containerWidth (right outside) to -textWidth (fully left outside)
            final startX = _containerWidth;
            final endX = -_textWidth - widget.gap;
            final dx = lerpDouble(startX, endX, _controller.value) ?? 0.0;

            return Transform.translate(
              offset: Offset(dx, 0),
              child: SizedBox(
                height: constraints.maxHeight,
                // width large enough to hold the text
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(right: widget.gap),
                    child: Text(
                      currentText,
                      style: widget.textStyle,
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      softWrap: false,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
