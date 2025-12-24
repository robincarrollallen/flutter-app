import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '/storage/persistent.dart';
import '/theme/index.dart';
import '/theme/type.dart';

class AppState {
  final token = ''.obs; // 令牌
  final currentTheme = themes[THEME.style25.key].obs; // 当前主题
  final _localeStorage = PersistentRx<Map<String, dynamic>>('locale_data', {
    'languageCode': 'en',
    'countryCode': 'US'
  });

  Rx<Locale> get locale {
    final data = _localeStorage.value;
    return Locale(data['languageCode'], data['countryCode'] ?? '').obs;
  }

  void setToken(String newToken) {
    token.value = newToken;
  }

  void setCurrentTheme(THEME theme) {
    currentTheme.value = themes[theme.key];
  }

  void setLocale(Locale lang) {
    Get.updateLocale(lang); // 触发整个 App 根节点的 Rebuild（重建)
    _localeStorage.value = {
      'languageCode': lang.languageCode,
      'countryCode': lang.countryCode,
    };
  }
}