import 'package:flutter/material.dart';

/// 自定义颜色扩展
class CustomColors extends ThemeExtension<CustomColors> {
  final Color? borderDefault;      // 品牌色
  final Color? textSuccess;    // 成功色
  final Color? textWarning;    // 警告色
  final Color? footbar;
  final Color? navigationDefault;
  final Color? navigationSelected;


  const CustomColors({
    this.borderDefault,
    this.textSuccess,
    this.textWarning,
    this.footbar,
    this.navigationDefault,
    this.navigationSelected,
  });

  @override
  CustomColors copyWith({
    Color? borderDefault,
    Color? textSuccess,
    Color? textWarning,
    Color? footbar,
    Color? navigationDefault,
    Color? navigationSelected,
  }) {
    return CustomColors(
      borderDefault: borderDefault ?? this.borderDefault,
      textSuccess: textSuccess ?? this.textSuccess,
      textWarning: textWarning ?? this.textWarning,
      footbar: footbar ?? this.footbar,
      navigationDefault: navigationDefault ?? this.navigationDefault,
      navigationSelected: navigationSelected ?? this.navigationSelected,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      borderDefault: Color.lerp(borderDefault, other.borderDefault, t),
      textSuccess: Color.lerp(textSuccess, other.textSuccess, t),
      textWarning: Color.lerp(textWarning, other.textWarning, t),
      footbar: Color.lerp(footbar, other.footbar, t),
      navigationDefault: Color.lerp(navigationDefault, other.navigationDefault, t),
      navigationSelected: Color.lerp(navigationSelected, other.navigationSelected, t),
    );
  }
}