import 'package:flutter/material.dart';
import '../services/storage_manager.dart';

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    bottomAppBarColor: Colors.grey.shade900,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    scaffoldBackgroundColor: Colors.black,
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    bottomAppBarColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
    scaffoldBackgroundColor: Colors.white,
  );

  ThemeMode themeMode = ThemeMode.system;

  ThemeNotifier() {
    // Changes the value of themeMode asynchronously because the constructor
    // is waiting for the StorageManager object to read data from the disk

    StorageManager.readData('themeMode').then((storedValue) {
      print('value read from storage: ' + storedValue.toString());

      if (storedValue == 'light') {
        print('setting light theme');

        themeMode = ThemeMode.light;
      } else if (storedValue == 'dark') {
        print('setting dark theme');

        themeMode = ThemeMode.dark;
      } else {
        print('setting system theme');

        themeMode = ThemeMode.system;
      }

      // Notifies the listeners for the updated value

      notifyListeners();
    });
  }

  // Check if dark mode is enabled
  bool isDarkModeOn() => themeMode == ThemeMode.dark;

  // Changes the state of dark mode (on or off)
  void setDarkMode(bool isOn) {
    if (isOn) {
      print('saving dark mode');

      StorageManager.saveData('themeMode', 'dark');

      themeMode = ThemeMode.dark;
    } else {
      print('saving light mode');

      StorageManager.saveData('themeMode', 'light');

      themeMode = ThemeMode.light;
    }

    notifyListeners();
  }

  // Setts up the theme mode to be updated with the system theme
  void setThemeModeSystem() {
    StorageManager.saveData('themeMode', 'system');

    themeMode = ThemeMode.system;

    print('saving system');

    notifyListeners();
  }
}
