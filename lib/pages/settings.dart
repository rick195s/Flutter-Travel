import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_travel/ui/theme_manager.dart';

const SET_SYSTEM_THEME = 3;

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

  // Disposing what was set
  @override
  void dispose() {
    super.dispose();
  }

  // Changing and storing the current theme mode
  changeTheme(value) {
    if (value == SET_SYSTEM_THEME) {
      themeProvider.setThemeModeSystem();
    } else {
      themeProvider.setDarkMode(value);
    }

    setState(() {
      isOn = themeProvider.isDarkModeOn();
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      isOn = themeProvider.isDarkModeOn();
    });

    return Row(
      children: [
        ElevatedButton(
          onPressed: () => {
            changeTheme(SET_SYSTEM_THEME),
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
