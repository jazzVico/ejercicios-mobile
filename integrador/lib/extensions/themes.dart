import 'package:flutter/material.dart';

ThemeData themes() {
  return ThemeData(
      textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, fontFamily: "Roboto"),
          titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ,fontFamily: "Roboto")

      ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.grey,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40))
        )
      ),
    ),
  );
}