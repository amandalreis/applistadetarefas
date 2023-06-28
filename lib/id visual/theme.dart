import 'package:flutter/material.dart';

final tema = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white24,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40))
          )
          ),
  useMaterial3: true,
);
