import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_travel/ui/theme_manager.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage(this.title);

  final String title;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isOn = false;
  late ThemeNotifier themeProvider;

  // When the widget its loaded this function will be executed
  @override
  void initState() {
    themeProvider = Provider.of<ThemeNotifier>(context, listen: false);
    super.initState();
  }

  // Actions done before disposing the widget
  @override
  void dispose() {
    super.dispose();
  }

  // Changes the theme switch state
  changeThemeSwitch() {
    setState(() {
      isOn = themeProvider.isDarkModeOn();
    });
  }

  // Changes and stores the current theme mode
  changeTheme(value) {
    themeProvider.setDarkMode(value);
    changeThemeSwitch();
  }

  @override
  Widget build(BuildContext context) {
    changeThemeSwitch();

    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            themeProvider.setThemeModeSystem();
            changeThemeSwitch();
          },
          child: Text("butoa"),
        ),
        Switch(
          value: isOn,
          onChanged: (value) {
            changeTheme(value);
          },
        ),
      ],
    );
  }
}
