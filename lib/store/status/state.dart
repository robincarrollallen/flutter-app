import 'package:get/get.dart';
import 'package:flutter/material.dart';

class StatusState {
  final loginVisibleType = 'login'.obs; // 显示类型: login / register

  /// 设置显示类型: login / register
  void setLoginVisibleType([String? type = 'login']) {
    loginVisibleType.value = type ?? 'login';
  }
}