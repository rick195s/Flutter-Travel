import 'package:flutter/material.dart';
import 'package:flutter_travel/services/storage_manager.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  ThemeNotifier() {
    // Changes the value of themeMode asynchronously because the constructor
    // is waiting for the StorageManager object to read data from the disk

    StorageManager.readData('themeMode').then((storedValue) {
      switch (storedValue) {
        case 'light':
          themeMode = ThemeMode.light;
          break;

        case 'dark':
          themeMode = ThemeMode.dark;
          break;

        default:
          themeMode = ThemeMode.system;
      }
      // Notifies the listeners for the updated value

      notifyListeners();
    });
  }

  // Check if dark mode is enabled
  bool isDarkModeOn(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // Changes the state of dark mode (on or off)
  void setDarkMode(bool isOn) {
    if (isOn) {
      StorageManager.saveData('themeMode', 'dark');

      themeMode = ThemeMode.dark;
    } else {
      StorageManager.saveData('themeMode', 'light');

      themeMode = ThemeMode.light;
    }

    notifyListeners();
  }

  // Setts up the theme mode to be updated with the system theme
  void setThemeModeSystem() {
    StorageManager.saveData('themeMode', 'system');

    themeMode = ThemeMode.system;

    notifyListeners();
  }
}
