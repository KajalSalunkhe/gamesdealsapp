import 'package:flutter/material.dart';
import 'package:gamesdealsapp/services/prefs.dart';

class ThemeProvider extends ChangeNotifier {
  // ThemeMode themeMode = ThemeMode.light;
  late ThemeMode themeMode;
  ThemeProvider(ThemeMode initial) {
    themeMode = initial;
  }

  void setTheme(ThemeMode mode) async {
    themeMode = mode;
     Prefs.saveTheme(mode);
    notifyListeners();
  }

  void toggleTheme() {
    if (themeMode == ThemeMode.light) {
      // themeMode = ThemeMode.dark;
      setTheme(ThemeMode.dark);
    } else {
      // themeMode = ThemeMode.light;
      setTheme(ThemeMode.light);
    }
    // notifyListeners();
  }

  bool isDark() {
    return (themeMode == ThemeMode.dark);
  }
}
