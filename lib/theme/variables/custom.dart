import 'package:flutter/material.dart';

/// 自定义颜色扩展
class CustomColors extends ThemeExtension<CustomColors> {
  final Color? bodyDefault;
  final Color? borderDefault;
  final Color? textDefault;
  final Color? textWeak;
  final Color? textWeaker;
  final Color? textBrandPrimary;
  final Color? textSelected;
  final Color? textSuccess;
  final Color? textWarning;
  final Color? footbar;
  final Color? surfaceRaisedL1;
  final Color? surfaceRaisedL2;
  final Color? navigationDefault;
  final Color? navigationSelected;
  final Color? topNavSecondary;
  final Color? gradientsPrimaryA;
  final Color? gradientsPrimaryB;
  final Color? gradientsTertiaryA;
  final Color? gradientsTertiaryB;
  final Color? btnLevel2Border;
  final Color? btnLevel3Border;
  final Color? iconDefault;
  final Color? iconBrandPrimary;
  final Color? inverse500;
  final Color? inverse600;
  final Color? neutralWhiteWhite10;

  const CustomColors({
    this.bodyDefault,
    this.borderDefault,
    this.textDefault,
    this.textWeak,
    this.textWeaker,
    this.textBrandPrimary,
    this.textSelected,
    this.textSuccess,
    this.textWarning,
    this.footbar,
    this.surfaceRaisedL1,
    this.surfaceRaisedL2,
    this.navigationDefault,
    this.navigationSelected,
    this.topNavSecondary,
    this.gradientsPrimaryA,
    this.gradientsPrimaryB,
    this.gradientsTertiaryA,
    this.gradientsTertiaryB,
    this.btnLevel2Border,
    this.btnLevel3Border,
    this.iconDefault,
    this.iconBrandPrimary,
    this.inverse500,
    this.inverse600,
    this.neutralWhiteWhite10,
  });

  @override
  CustomColors copyWith({
    Color? bodyDefault,
    Color? borderDefault,
    Color? textDefault,
    Color? textWeak,
    Color? textWeaker,
    Color? textBrandPrimary,
    Color? textSelected,
    Color? textSuccess,
    Color? textWarning,
    Color? footbar,
    Color? surfaceRaisedL1,
    Color? surfaceRaisedL2,
    Color? navigationDefault,
    Color? navigationSelected,
    Color? topNavSecondary,
    Color? gradientsPrimaryA,
    Color? gradientsPrimaryB,
    Color? gradientsTertiaryA,
    Color? gradientsTertiaryB,
    Color? btnLevel2Border,
    Color? btnLevel3Border,
    Color? iconDefault,
    Color? iconBrandPrimary,
    Color? inverse500,
    Color? inverse600,
    Color? neutralWhiteWhite10,
  }) {
    return CustomColors(
      bodyDefault: bodyDefault ?? this.bodyDefault,
      borderDefault: borderDefault ?? this.borderDefault,
      textDefault: textDefault ?? this.textDefault,
      textWeak: textWeak ?? this.textWeak,
      textWeaker: textWeaker ?? this.textWeaker,
      textBrandPrimary: textBrandPrimary ?? this.textBrandPrimary,
      textSelected: textSelected ?? this.textSelected,
      textSuccess: textSuccess ?? this.textSuccess,
      textWarning: textWarning ?? this.textWarning,
      footbar: footbar ?? this.footbar,
      surfaceRaisedL1: surfaceRaisedL1 ?? this.surfaceRaisedL1,
      surfaceRaisedL2: surfaceRaisedL2 ?? this.surfaceRaisedL2,
      navigationDefault: navigationDefault ?? this.navigationDefault,
      navigationSelected: navigationSelected ?? this.navigationSelected,
      topNavSecondary: topNavSecondary ?? this.topNavSecondary,
      gradientsPrimaryA: gradientsPrimaryA ?? this.gradientsPrimaryA,
      gradientsPrimaryB: gradientsPrimaryB ?? this.gradientsPrimaryB,
      gradientsTertiaryA: gradientsTertiaryA ?? this.gradientsTertiaryA,
      gradientsTertiaryB: gradientsTertiaryB ?? this.gradientsTertiaryB,
      btnLevel2Border: btnLevel2Border ?? this.btnLevel2Border,
      btnLevel3Border: btnLevel3Border ?? this.btnLevel3Border,
      iconDefault: iconDefault ?? this.iconDefault,
      iconBrandPrimary: iconBrandPrimary ?? this.iconBrandPrimary,
      inverse500: inverse500 ?? this.inverse500,
      inverse600: inverse600 ?? this.inverse600,
      neutralWhiteWhite10: neutralWhiteWhite10 ?? this.neutralWhiteWhite10,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      bodyDefault: Color.lerp(bodyDefault, other.bodyDefault, t),
      borderDefault: Color.lerp(borderDefault, other.borderDefault, t),
      textDefault: Color.lerp(textDefault, other.textDefault, t),
      textWeak: Color.lerp(textWeak, other.textWeak, t),
      textWeaker: Color.lerp(textWeaker, other.textWeaker, t),
      textBrandPrimary: Color.lerp(textBrandPrimary, other.textBrandPrimary, t),
      textSuccess: Color.lerp(textSuccess, other.textSuccess, t),
      textWarning: Color.lerp(textWarning, other.textWarning, t),
      footbar: Color.lerp(footbar, other.footbar, t),
      surfaceRaisedL1: Color.lerp(surfaceRaisedL1, other.surfaceRaisedL1, t),
      surfaceRaisedL2: Color.lerp(surfaceRaisedL2, other.surfaceRaisedL2, t),
      navigationDefault: Color.lerp(navigationDefault, other.navigationDefault, t),
      navigationSelected: Color.lerp(navigationSelected, other.navigationSelected, t),
      topNavSecondary: Color.lerp(topNavSecondary, other.topNavSecondary, t),
      gradientsPrimaryA: Color.lerp(gradientsPrimaryA, other.gradientsPrimaryA, t),
      gradientsPrimaryB: Color.lerp(gradientsPrimaryB, other.gradientsPrimaryB, t),
      gradientsTertiaryA: Color.lerp(gradientsTertiaryA, other.gradientsTertiaryA, t),
      gradientsTertiaryB: Color.lerp(gradientsTertiaryB, other.gradientsTertiaryB, t),
      btnLevel2Border: Color.lerp(btnLevel2Border, other.btnLevel2Border, t),
      btnLevel3Border: Color.lerp(btnLevel3Border, other.btnLevel3Border, t),
      iconDefault: Color.lerp(iconDefault, other.iconDefault, t),
      iconBrandPrimary: Color.lerp(iconBrandPrimary, other.iconBrandPrimary, t),
      inverse500: Color.lerp(inverse500, other.inverse500, t),
      inverse600: Color.lerp(inverse600, other.inverse600, t),
      neutralWhiteWhite10: Color.lerp(neutralWhiteWhite10, other.neutralWhiteWhite10, t),
    );
  }
}