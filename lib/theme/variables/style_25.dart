import 'package:flutter/material.dart';
import './custom.dart';

final ThemeData style25 = ThemeData.dark().copyWith(
  primaryColor: Colors.red,
  splashColor: Colors.transparent, // 点击波纹颜色
  highlightColor: Colors.transparent, // 点击高亮底色
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromRGBO(18, 23, 19, 1)
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Color.fromRGBO(255, 255, 255, 1),
    unselectedItemColor: Color.fromRGBO(255, 255, 255, .4),
    backgroundColor: Color.fromRGBO(10, 13, 10, 1),
    type: BottomNavigationBarType.fixed,
  ),
  colorScheme: ThemeData
    .dark()
    .colorScheme
    .copyWith(
      secondary: Colors.yellow,
    ),
  tabBarTheme: TabBarThemeData(indicatorColor: Colors.green),
  extensions: <ThemeExtension<dynamic>>[
    const CustomColors(
      bodyDefault: Color.fromRGBO(13, 18, 13, 1),
      borderDefault: Color.fromRGBO(29, 41, 30, 1),
      borderBrand: Color.fromRGBO(25, 204, 16, 1),
      textDefault: Color.fromRGBO(255, 255, 255, 1),
      textWeak: Color.fromRGBO(255, 255, 255, .6),
      textWeaker: Color.fromRGBO(255, 255, 255, .4),
      textBrandPrimary: Color.fromRGBO(25, 204, 16, 1),
      textSelected: Color.fromRGBO(25, 204, 16, 1),
      textSuccess: Colors.green,
      textWarning: Color.fromRGBO(252, 151, 76, 1),
      textHighlight: Color.fromRGBO(245, 200, 76, 1),
      footbar: Color.fromRGBO(10, 13, 10, 1),
      surfaceRaisedL1: Color.fromRGBO(18, 23, 19, 1),
      surfaceRaisedL2: Color.fromRGBO(23, 33, 23, 1),
      surfaceLowered: Color.fromRGBO(10, 13, 10, 1),
      navigationDefault: Color.fromRGBO(255, 255, 255, .4),
      navigationSelected: Color.fromRGBO(255, 255, 255, 1),
      topNavSecondary: Color.fromRGBO(18, 23, 19, 1),
      gradientsPrimaryA: Color.fromRGBO(18, 145, 11, 1),
      gradientsPrimaryB: Color.fromRGBO(25, 204, 16, 1),
      gradientsTertiaryA: Color.fromRGBO(5, 81, 148, 1),
      gradientsTertiaryB: Color.fromRGBO(7, 114, 208, 1),
      btnLevel2Border: Color.fromRGBO(25, 204, 16, 1),
      btnLevel3Border: Color.fromRGBO(255, 199, 84, 1),
      iconDefault: Color.fromRGBO(25, 204, 16, 1),
      iconWeaker: Color.fromRGBO(255, 255, 255, .4),
      iconBrandPrimary: Color.fromRGBO(25, 204, 16, 1),
      inverse500: Color.fromRGBO(255, 171, 0, 1),
      inverse600: Color.fromRGBO(232, 156, 0, 1),
      neutralWhiteWhite10: Color.fromRGBO(255, 255, 255, .1),
      neutralWhiteWhite20: Color.fromRGBO(255, 255, 255, .2),
      glowPrimaryOpacity40: Color.fromRGBO(25, 204, 16, .4),
      glowPrimaryOpacity100: Color.fromRGBO(25, 204, 16, 1),
    ),
  ],
);