import 'package:get/get.dart';

class LoginState {
  final isValid = false.obs; // 表单验证状态

  /// 设置表单验证状态
  void setIsValid([bool? valid = false]) {
    isValid.value = valid ?? false;
  }
}