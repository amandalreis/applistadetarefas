import 'package:flutter/material.dart';

final tema = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2))
          )
          ),
  useMaterial3: true,
);
