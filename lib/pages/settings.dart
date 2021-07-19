import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hotel/ui/theme_manager.dart';

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
    super.initState();

    themeProvider = Provider.of<ThemeNotifier>(context, listen: false);
  }

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
