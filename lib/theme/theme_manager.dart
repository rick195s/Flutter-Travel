import 'package:flutter/material.dart';
import 'package:flutter_travel/services/storage_manager.dart';

class ThemeNotifier extends ValueNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system) {
    // Changes the value of themeMode asynchronously because the constructor
    // is waiting for the StorageManager object to read data from the disk

    StorageManager.readData('themeMode').then((storedValue) {
      switch (storedValue) {
        case 'light':
          value = ThemeMode.light;
          break;

        case 'dark':
          value = ThemeMode.dark;
          break;

        default:
          value = ThemeMode.system;
      }
      // Notifies the listeners for the updated value
    });
  }

  ThemeMode get themeMode => value;

  // Check if dark mode is enabled
  bool isDarkModeOn(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // Changes the state of dark mode (on or off)
  void setDarkMode(bool isOn) {
    if (isOn) {
      StorageManager.saveData('themeMode', 'dark');
      value = ThemeMode.dark;
    } else {
      StorageManager.saveData('themeMode', 'light');
      value = ThemeMode.light;
    }
  }

  // Setts up the theme mode to be updated with the system theme
  void setThemeModeSystem() {
    StorageManager.saveData('themeMode', 'system');
    value = ThemeMode.system;
  }
}
