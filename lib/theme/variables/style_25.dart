import 'package:flutter/material.dart';
import './custom.dart';

final ThemeData style25 = ThemeData.dark().copyWith(
  primaryColor: Colors.red,
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
      textDefault: Color.fromRGBO(255, 255, 255, 1),
      borderDefault: Color(0xFF1C2334),
      textSuccess: Colors.green,
      textWarning: Colors.yellow,
      footbar: Color.fromRGBO(10, 13, 10, 1),
      navigationDefault: Color.fromRGBO(255, 255, 255, .4),
      navigationSelected: Color.fromRGBO(255, 255, 255, 1),
      topNavSecondary: Color.fromRGBO(18, 23, 19, 1),
      gradientsPrimaryA: Color.fromRGBO(18, 145, 11, 1),
      gradientsPrimaryB: Color.fromRGBO(25, 204, 16, 1),
      btnLevel2Border: Color.fromRGBO(25, 204, 16, 1),
      btnLevel3Border: Color.fromRGBO(255, 199, 84, 1),
      inverse500: Color.fromRGBO(255, 171, 0, 1),
      inverse600: Color.fromRGBO(232, 156, 0, 1),
    ),
  ],
);