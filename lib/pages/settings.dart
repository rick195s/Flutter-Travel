import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage(this.title);

  final String title;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('$count'),
    );
  }
}
