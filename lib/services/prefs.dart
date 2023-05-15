import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static void saveTheme(ThemeMode themeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        "theme", (themeMode == ThemeMode.dark) ? "dark" : "light");
  }

  static Future<ThemeMode> fetchTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String themeString = prefs.getString("theme") ?? "light";
    return (themeString == "light") ? ThemeMode.light : ThemeMode.dark;
  }
}
