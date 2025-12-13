import '/enums/input.dart';

class Validators {
  // 根据类型获取对应验证器
  static String? Function(String?) getValidator(InputType type) {
    switch (type) {
      case InputType.account:
        return (value) {
          if (value == null || value.isEmpty) return type.emptyError;
          final regExp = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z][a-zA-Z0-9]{7,15}$');
          if (!regExp.hasMatch(value)) return type.formatError;
          return null;
        };
      case InputType.email:
        return (value) {
          if (value == null || value.isEmpty) return type.emptyError;
          final regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
          if (!regExp.hasMatch(value)) return type.formatError;
          return null;
        };
      case InputType.phone:
        return (value) {
          if (value == null || value.isEmpty) return type.emptyError;
          final regExp = RegExp(r'^1[3-9]\d{9}$');
          if (!regExp.hasMatch(value)) return type.formatError;
          return null;
        };
      case InputType.password:
        return (value) {
          if (value == null || value.isEmpty) return type.emptyError;
          if (value.length < 6 || value.length > 20) return type.formatError;
          return null;
        };
      case InputType.text:
        return (_) => null;
    }
  }
}