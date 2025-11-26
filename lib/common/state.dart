import 'dart:ui';

import 'package:get/get.dart';

import '../theme/index.dart';
import '../theme/type.dart';

class CommonState {
  final token = 'zh'.obs; // 令牌
  final locale = Locale('zh', 'CN').obs;
  final currentTheme = themes[THEME.style25.key].obs; // 当前主题

  void setToken(String newToken) {
    // 可以在这里添加验证逻辑∂
    token.value = newToken;
  }

  void setCurrentTheme(THEME theme) {
    currentTheme.value = themes[theme.key];
  }

  void setLocale(Locale lang) {
    Get.updateLocale(lang);
    locale.value = lang;
  }
}