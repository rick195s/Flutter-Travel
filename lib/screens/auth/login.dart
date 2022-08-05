import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizing/sizing.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            Text(AppLocalizations.of(context)!.welcomeTo),
            Text("Flutter Travel",
                style: Theme.of(context).textTheme.headlineLarge),
            Container(
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              width: 275.ss,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                color: Color(0xff023E7D),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.email,
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Color(0xff087CF2),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: TextField(
                      obscureText: !_showPassword,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.password,
                        labelStyle: Theme.of(context).textTheme.labelMedium,
                        suffixIcon: IconButton(
                          icon: _showPassword
                              ? Icon(LineIcons.eye)
                              : Icon(LineIcons.eyeSlash),
                          onPressed: (() {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          }),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(0xff087CF2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SelectableText("data"),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
