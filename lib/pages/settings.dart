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

  // Disposing what was set
  @override
  void dispose() {
    super.dispose();
  }

  // Changing and storing the current theme mode
  changeTheme(value) {
    setState(() {
      isOn = value;
    });

    themeProvider.setDarkMode(isOn);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      isOn = themeProvider.isDarkModeOn();
    });

    return Row(
      children: [
        ElevatedButton(
          onPressed: themeProvider.setThemeModeSystem,
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
