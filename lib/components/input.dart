import 'package:flutter/material.dart';
import '/theme/variables/custom.dart';
import '/hooks/validator/input.dart';
import '/utils/screen.dart';
import '/enums/input.dart';

class Input extends StatelessWidget {
  final String? hintText;
  final InputType type;
  final bool validate;

  const Input({
    super.key,
    this.hintText,
    this.type = InputType.text,
    this.validate = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展>

    return TextFormField(
      cursorColor: colors?.textDefault, // 光标颜色
      cursorWidth: 2.0, // 光标宽度
      cursorHeight: 15, // 光标高度
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText ?? type.hintText,
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
      validator: validate ? Validators.getValidator(type) : null
    );
  }
}