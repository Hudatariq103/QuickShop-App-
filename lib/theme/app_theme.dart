import 'package:flutter/material.dart';

const Color navy = Color(0xFF351526);
const Color blue = Color(0xFF263B63);
const Color paleBlue = Color(0xFFF1E8EC);
const Color pageColor = Color(0xFFF8F5F1);
const Color terracotta = Color(0xFF8E3D58);
const Color warmSand = Color(0xFFEDE5DF);

final ThemeData quickShopTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: pageColor,
  colorScheme: ColorScheme.fromSeed(seedColor: terracotta, brightness: Brightness.light),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFF351526)),
    bodyMedium: TextStyle(color: Color(0xFF351526)),
    bodySmall: TextStyle(color: Color(0xFF5D5055)),
    titleLarge: TextStyle(color: Color(0xFF351526), fontWeight: FontWeight.bold),
    titleMedium: TextStyle(color: Color(0xFF351526), fontWeight: FontWeight.w600),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: navy,
    elevation: 0,
    centerTitle: false,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Color(0xFFE5E0D6)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: blue, width: 1.5),
    ),
  ),
);
