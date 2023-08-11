import 'package:flutter/material.dart';

class MyThemes {
  const MyThemes._();

  static ThemeData light() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.redAccent),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );
  }
}