import 'dart:ui';

import 'package:get/get.dart';
import '/model/tenant_info_model.dart';
import '/theme/index.dart';
import '/theme/type.dart';

class CommonState {
  final token = ''.obs; // 令牌
  final locale = Locale('en', 'US').obs;
  final currentTheme = themes[THEME.style25.key].obs; // 当前主题
  final tenantInfo = TenantInfoModel().obs;

  void setToken(String newToken) {
    token.value = newToken;
  }

  void setCurrentTheme(THEME theme) {
    currentTheme.value = themes[theme.key];
  }

  void setLocale(Locale lang) {
    Get.updateLocale(lang);
    locale.value = lang;
  }

  void setTenantInfo(TenantInfoModel info) {
    tenantInfo.value = info;
  }
}