import 'package:flutter/material.dart';
import './custom.dart';

final ThemeData style25 = ThemeData(
  primaryColor: Colors.red,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF101629)
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
  useMaterial3: true,
  extensions: <ThemeExtension<dynamic>>[
    const CustomColors(
      borderDefault: Color(0xFF1C2334),
      textSuccess: Colors.green,
      textWarning: Colors.yellow,
      footbar: Color.fromRGBO(10, 13, 10, 1),
      navigationDefault: Color.fromRGBO(255, 255, 255, .4),
      navigationSelected: Color.fromRGBO(255, 255, 255, 1),
    ),
  ],
);