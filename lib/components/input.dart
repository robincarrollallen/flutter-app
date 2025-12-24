import 'package:flutter/material.dart';
import '/theme/variables/custom.dart';
import '/hooks/validator/input.dart';
import '/utils/screen.dart';
import '/enums/input.dart';

class Input extends StatefulWidget {
  final String? hintText;
  final InputType type;
  final bool validate;
  final bool clear;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;

  const Input({
    super.key,
    this.hintText,
    this.type = InputType.text,
    this.validate = false,
    this.clear = false,
    this.prefixIcon,
    this.onChanged
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  late final TextEditingController _controller;
  late final bool _isPasswordType;
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _isPasswordType = widget.type == InputType.password;
    _isObscured = _isPasswordType;
    // 添加监听器，当输入框内容变化时，调用 setState 来触发UI重建
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // 销毁 controller 以释放资源
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展>

    return TextFormField(
        controller: _controller,
        obscureText: _isObscured,
        cursorColor: colors?.textDefault, // 光标颜色
        cursorWidth: 2.0, // 光标宽度
        cursorHeight: 15, // 光标高度
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: widget.hintText ?? widget.type.hintText,
          hintStyle: TextStyle(
            color: colors?.textWeaker,
            fontSize: 14.0.rem(),
          ),
          helperText: '',
          // 未获取焦点时的边框
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: colors?.borderDefault ?? Colors.grey)
          ),
          // 获取焦点时的边框
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: colors?.borderDefault ?? Colors.grey, width: 2.0.rem())
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: _isPasswordType
              ? IconButton(
            icon: Icon(
              // 根据状态显示不同的图标
              _isObscured ? Icons.visibility_off : Icons.visibility,
              color: colors?.textWeaker,
            ),
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured;
              });
            },
          )
          // 只有在输入框非空且不是密码类型时，才显示清除按钮
          : (_controller.text.isNotEmpty && widget.clear
          ? IconButton(
            icon: Icon(Icons.clear, color: colors?.textWeaker),
            onPressed: () {
              // 如果绑定了 onChanged，清空时也需要触发一下，传入空字符串
              _controller.clear();
              widget.onChanged?.call('');
            },
          )
          : null // 如果没有内容，则不显示任何图标
          ),
          // 错误文字样式
          errorStyle: TextStyle(
            color: Colors.red,
            fontSize: 12,
          ),
          // 错误时边框颜色
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(8),
          ),
          // 获取焦点时的错误边框
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onChanged: widget.onChanged,
        validator: widget.validate ? Validators.getValidator(widget.type) : null
    );
  }
}
