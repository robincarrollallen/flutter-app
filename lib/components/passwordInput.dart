import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 密码输入控制器
class PasswordInputController extends ChangeNotifier {
  _PasswordInputState? _state;

  void _attach(_PasswordInputState state) {
    _state = state;
  }

  void _detach() {
    _state = null;
  }

  /// 清空输入
  void clear() {
    _state?._clear();
  }

  /// 获取当前值
  String get value => _state?._controller.text ?? '';

  /// 设置值
  void setValue(String value) {
    _state?._setValue(value);
  }

  /// 获取焦点
  void focus() {
    _state?._focusNode.requestFocus();
  }

  /// 失去焦点
  void unfocus() {
    _state?._focusNode.unfocus();
  }
}

/// 密码/验证码输入组件
class PasswordInput extends StatefulWidget {
  /// 密码长度
  final int length;

  /// 初始值
  final String? value;

  /// 自动聚焦
  final bool autofocus;

  /// 外部控制器
  final PasswordInputController? controller;

  /// 输入回调
  final ValueChanged<String>? onChanged;

  /// 输入完成回调
  final ValueChanged<String>? onCompleted;

  /// 背景颜色
  final Color? backgroundColor;

  /// 聚焦边框颜色
  final Color? focusBorderColor;

  /// 密码点颜色
  final Color? dotColor;

  /// 光标颜色
  final Color? cursorColor;

  /// 单个框尺寸
  final double? itemSize;

  /// 圆角
  final double? borderRadius;

  /// 框之间的间距
  final double? spacing;

  const PasswordInput({
    super.key,
    this.length = 6,
    this.value,
    this.autofocus = false,
    this.controller,
    this.onChanged,
    this.onCompleted,
    this.backgroundColor,
    this.focusBorderColor,
    this.dotColor,
    this.cursorColor,
    this.itemSize,
    this.borderRadius,
    this.spacing,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value ?? '');
    _focusNode = FocusNode();

    // 绑定控制器
    widget.controller?._attach(this);

    // 监听焦点变化
    _focusNode.addListener(_handleFocusChange);

    // 自动聚焦
    if (widget.autofocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  @override
  void didUpdateWidget(PasswordInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 更新控制器绑定
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller?._detach();
      widget.controller?._attach(this);
    }
  }

  @override
  void dispose() {
    widget.controller?._detach();
    _focusNode.removeListener(_handleFocusChange);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _handleChange(String value) {
    // 只允许数字
    final filtered = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (filtered != value) {
      _controller.text = filtered;
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: filtered.length),
      );
    }

    setState(() {});
    widget.onChanged?.call(filtered);

    // 输入完成回调
    if (filtered.length == widget.length) {
      widget.onCompleted?.call(filtered);
    }
  }

  /// 清空输入
  void _clear() {
    _controller.clear();
    setState(() {});
    widget.onChanged?.call('');
  }

  /// 设置值
  void _setValue(String value) {
    final filtered = value.replaceAll(RegExp(r'[^0-9]'), '');
    final truncated = filtered.length > widget.length
        ? filtered.substring(0, widget.length)
        : filtered;
    _controller.text = truncated;
    _controller.selection = TextSelection.fromPosition(
      TextPosition(offset: truncated.length),
    );
    setState(() {});
    widget.onChanged?.call(truncated);

    if (truncated.length == widget.length) {
      widget.onCompleted?.call(truncated);
    }
  }

  @override
  Widget build(BuildContext context) {
    final itemSize = widget.itemSize ?? 44.0;
    final borderRadius = widget.borderRadius ?? 4.0;
    final password = _controller.text;
    final focusIndex = _isFocused ? password.length : -1;

    return GestureDetector(
      onTap: () => _focusNode.requestFocus(),
      child: SizedBox(
        height: itemSize,
        child: Stack(
          children: [
            // 密码框显示
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(widget.length, (index) {
                final hasValue = index < password.length;
                final isFocused = focusIndex == index;

                return Container(
                  width: itemSize,
                  height: itemSize,
                  decoration: BoxDecoration(
                    color: widget.backgroundColor ?? Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(borderRadius),
                    border: Border.all(
                      color: isFocused
                          ? (widget.focusBorderColor ?? Colors.blue)
                          : Colors.transparent,
                      width: 1,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: hasValue
                      ? _buildDot()
                      : (isFocused ? _buildCursor() : null),
                );
              }),
            ),

            // 隐藏的输入框
            Positioned.fill(
              child: Opacity(
                opacity: 0,
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  keyboardType: TextInputType.number,
                  maxLength: widget.length,
                  autofocus: widget.autofocus,
                  enableInteractiveSelection: false,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(widget.length),
                  ],
                  decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                  ),
                  onChanged: _handleChange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 密码点
  Widget _buildDot() {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: widget.dotColor ?? Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }

  /// 闪烁光标
  Widget _buildCursor() {
    return _BlinkingCursor(
      color: widget.cursorColor ?? Colors.white,
    );
  }
}

/// 闪烁光标组件
class _BlinkingCursor extends StatefulWidget {
  final Color color;

  const _BlinkingCursor({
    required this.color,
  });

  @override
  State<_BlinkingCursor> createState() => _BlinkingCursorState();
}

class _BlinkingCursorState extends State<_BlinkingCursor>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 1, end: 0).animate(_controller);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        width: 1,
        height: 16,
        color: widget.color,
      ),
    );
  }
}