// ignore_for_file: non_constant_identifier_names

import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:flutter/material.dart';

ThemeData Arabic_theme = ThemeData(
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(size: 20, color: Appcolor.primaryColor),
        titleTextStyle: TextStyle(
            fontFamily: "Cairo",
            color: Appcolor.primaryColor,
            fontSize: 30,
            fontWeight: FontWeight.bold)),
    fontFamily: "Cairo",

    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    textTheme: const TextTheme(
        displayMedium: TextStyle(fontSize: 28),
        headlineLarge: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        bodyMedium: TextStyle(fontSize: 18, color: Appcolor.grey)));

ThemeData English_theme = ThemeData(
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Appcolor.primaryColor),
        titleTextStyle: TextStyle(
            color: Appcolor.primaryColor,
            fontSize: 30,
            fontWeight: FontWeight.bold)),
    fontFamily: "PlayfairDisplay",
    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    textTheme: const TextTheme(
        displayMedium: TextStyle(fontSize: 28),
        headlineLarge: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        bodyMedium: TextStyle(fontSize: 18, color: Appcolor.grey)));
