import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import '/hooks/dialog/language_dialog.dart';
import 'state.dart';

class ProfileNavigationLogic extends GetxController {
  ProfileNavigationState state = ProfileNavigationState();

  late BuildContext context;

  @override
  void onReady() {
    super.onReady();
    context = Get.context!; // 获取BuildContext上下文
  }

  /// 导航标签点击事件
  void handleNavigation(String link) {
    if (link == 'language') {
      showLanguageDialog(context);
    }
  }
}