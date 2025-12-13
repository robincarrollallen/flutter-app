import 'package:get/get.dart';

enum InputType {
  account,
  email,
  phone,
  password,
  text,  // 默认，不验证
}

extension InputTypeExtension on InputType {
  // 获取 hintText
  String get hintText {
    switch (this) {
      case InputType.account:
        return 'input_hint_account'.tr;
      case InputType.email:
        return 'input_hint_email'.tr;
      case InputType.phone:
        return 'input_hint_phone'.tr;
      case InputType.password:
        return 'input_hint_password'.tr;
      case InputType.text:
        return 'input_hint_text'.tr;
    }
  }

  // 顺便把验证错误信息也加上
  String get emptyError {
    switch (this) {
      case InputType.account:
        return 'input_error_account'.tr;
      case InputType.email:
        return 'input_error_email'.tr;
      case InputType.phone:
        return 'input_error_phone'.tr;
      case InputType.password:
        return 'input_error_password'.tr;
      case InputType.text:
        return '';
    }
  }

  String get formatError {
    switch (this) {
      case InputType.account:
        return 'input_format_account'.tr;
      case InputType.email:
        return 'input_format_email'.tr;
      case InputType.phone:
        return 'input_format_phone'.tr;
      case InputType.password:
        return 'input_format_password'.tr;
      case InputType.text:
        return '';
    }
  }
}

