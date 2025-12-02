import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  late TabController tabController; // 定义导航标签控制器

  /// 生命周期: 初始化
  @override
  void onInit() {
    super.onInit();
  }

  /// 隐藏PWA安装栏
  void hidePwa() {
    state.setShowPWA();
    update();
  }
}
