import 'package:flutter/material.dart';

/// 自定义颜色扩展
class CustomColors extends ThemeExtension<CustomColors> {
  final Color? textDefault;    // 默认文本色
  final Color? borderDefault;  // 默认边框色
  final Color? textSuccess;    // 成功色
  final Color? textWarning;    // 警告色
  final Color? footbar;
  final Color? navigationDefault;
  final Color? navigationSelected;
  final Color? topNavSecondary;
  final Color? gradientsPrimaryA;
  final Color? gradientsPrimaryB;
  final Color? btnLevel2Border;
  final Color? btnLevel3Border;
  final Color? inverse500;
  final Color? inverse600;

  const CustomColors({
    this.textDefault,
    this.borderDefault,
    this.textSuccess,
    this.textWarning,
    this.footbar,
    this.navigationDefault,
    this.navigationSelected,
    this.topNavSecondary,
    this.gradientsPrimaryA,
    this.gradientsPrimaryB,
    this.btnLevel2Border,
    this.btnLevel3Border,
    this.inverse500,
    this.inverse600,
  });

  @override
  CustomColors copyWith({
    Color? textDefault,
    Color? borderDefault,
    Color? textSuccess,
    Color? textWarning,
    Color? footbar,
    Color? navigationDefault,
    Color? navigationSelected,
    Color? topNavSecondary,
    Color? gradientsPrimaryA,
    Color? gradientsPrimaryB,
    Color? btnLevel2Border,
    Color? btnLevel3Border,
    Color? inverse500,
    Color? inverse600,
  }) {
    return CustomColors(
      textDefault: textDefault ?? this.textDefault,
      borderDefault: borderDefault ?? this.borderDefault,
      textSuccess: textSuccess ?? this.textSuccess,
      textWarning: textWarning ?? this.textWarning,
      footbar: footbar ?? this.footbar,
      navigationDefault: navigationDefault ?? this.navigationDefault,
      navigationSelected: navigationSelected ?? this.navigationSelected,
      topNavSecondary: topNavSecondary ?? this.topNavSecondary,
      gradientsPrimaryA: gradientsPrimaryA ?? this.gradientsPrimaryA,
      gradientsPrimaryB: gradientsPrimaryB ?? this.gradientsPrimaryB,
      btnLevel2Border: btnLevel2Border ?? this.btnLevel2Border,
      btnLevel3Border: btnLevel3Border ?? this.btnLevel3Border,
      inverse500: inverse500 ?? this.inverse500,
      inverse600: inverse600 ?? this.inverse600,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      textDefault: Color.lerp(textDefault, other.textDefault, t),
      borderDefault: Color.lerp(borderDefault, other.borderDefault, t),
      textSuccess: Color.lerp(textSuccess, other.textSuccess, t),
      textWarning: Color.lerp(textWarning, other.textWarning, t),
      footbar: Color.lerp(footbar, other.footbar, t),
      navigationDefault: Color.lerp(navigationDefault, other.navigationDefault, t),
      navigationSelected: Color.lerp(navigationSelected, other.navigationSelected, t),
      topNavSecondary: Color.lerp(topNavSecondary, other.topNavSecondary, t),
      gradientsPrimaryA: Color.lerp(gradientsPrimaryA, other.gradientsPrimaryA, t),
      gradientsPrimaryB: Color.lerp(gradientsPrimaryB, other.gradientsPrimaryB, t),
      btnLevel2Border: Color.lerp(btnLevel2Border, other.btnLevel2Border, t),
      btnLevel3Border: Color.lerp(btnLevel3Border, other.btnLevel3Border, t),
    );
  }
}