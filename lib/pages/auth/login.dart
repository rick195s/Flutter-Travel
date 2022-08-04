import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Column(
        children: <Widget>[
          Text(AppLocalizations.of(context)!.welcomeTo),
          Text(
            "Flutter Travel",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue,
            ),
            child: Column(
              children: <Widget>[
                TextField(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
