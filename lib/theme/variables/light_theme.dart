import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.purple,
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateColor.resolveWith((states) => Colors.black12),
    shape: const CircleBorder()
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  tabBarTheme: TabBarThemeData(indicatorColor: Colors.green),
);