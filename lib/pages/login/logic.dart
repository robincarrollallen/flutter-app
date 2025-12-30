import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '/model/dto/login_info_model.dart';
import '/hooks/loading/loading.dart';
import '/store/status/state.dart';
import '/store/status/logic.dart';
import '/store/app/logic.dart';
import '/store/app/state.dart';
import 'state.dart';

class LoginLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final LoginState state = LoginState();
  final AppState appState = Get.find<AppLogic>().state;
  final StatusState statusState = Get.find<StatusLogic>().state;
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

  /// 账号输入监听回调
  void accountChange(String value) {
    print('>>>>>>>>>>>>> $value');
  }

  /// 密码输入监听回调
  void passwordChange(String value) {
    print('>>>>>>>>>>>>> $value');
  }

  // TODO 模拟网络
  Future<void> login() async {
    Loading.show();
    await Future.delayed(const Duration(seconds: 1)); // 模拟网络延迟
    final String jsonString = await rootBundle.loadString('assets/mock/login_info.json'); // 读取 JSON 文件
    final LoginInfoModel info = loginInfoModelFromJson(jsonString); // 解析 JSON
    appState.setToken(info.token ?? ''); // 设置令牌
    Loading.hide();
    Get.back();
  }
}