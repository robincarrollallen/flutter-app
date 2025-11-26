import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.red,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF101629)
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF101629)
  ),
  tabBarTheme: TabBarThemeData(indicatorColor: Colors.green),
  colorScheme: ThemeData
      .dark()
      .colorScheme
      .copyWith(
    secondary: Colors.yellow,
  ),
);