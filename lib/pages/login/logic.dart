import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginLogic extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController; // 定义导航标签控制器

  /// 生命周期: 初始化
  @override
  void onInit() {
    super.onInit();

    tabController = TabController(vsync: this, length: 2); // 赋值导航栏控制器
  }
}