import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'state.dart';

class LoginLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final LoginState state = LoginState();
  late TabController tabController; // 定义导航标签控制器
  final formKey = GlobalKey<FormState>(); // 定义表单Key

  /// 生命周期: 初始化
  @override
  void onInit() {
    super.onInit();

    tabController = TabController(vsync: this, length: 2); // 赋值导航栏控制器
  }

  /// 表单验证监听回调
  void validateForm() {
    state.setIsValid(formKey.currentState?.validate()); // 设置表单验证状态
  }
}