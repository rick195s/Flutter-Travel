import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage(this.title);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        alignment: Alignment.center,
        child: Text(widget.title),
      ),
    );
  }
}
