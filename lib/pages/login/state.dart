import 'package:get/get.dart';

class LoginState {
  final isValid = false.obs; // 表单验证状态
  final visibleType = 'login'.obs; // 显示类型: login / register

  /// 设置表单验证状态
  void setIsValid([bool? valid = false]) {
    isValid.value = valid ?? false;
  }

  /// 设置显示类型: login / register
  void setVisibleType([String? type = 'login']) {
    visibleType.value = type ?? 'login';
  }
}