import 'dart:ui';

/// 主题枚举
enum LOCALE {
  zhCN('zh_CN', Locale('zh', 'CN')),
  enUS('en_US', Locale('en', 'US'));

  final String code;
  final Locale locale;

  const LOCALE(this.code, this.locale);

  /// 根据 code 字符串查找 THEME 枚举成员。[code] 要查找的字符串，例如 'en_US'
  static LOCALE fromCode(String code) {
    return LOCALE.values.firstWhere(
      (locale) => locale.code == code,
      /// 如果找不到匹配的成员，会抛出异常。
      orElse: () => throw ArgumentError('未找到key为 "$code" 的主题'),
    );
  }
}