import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_travel/components/auth_selectable_text.dart';
import 'package:flutter_travel/components/text_fields.dart';
import 'package:flutter_travel/screens/auth/login.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizing/sizing.dart';
import 'package:rive/rive.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(children: <Widget>[
      RiveAnimation.asset(
        'lib/assets/login_background.riv',
        fit: BoxFit.fill,
        controllers: [
          OneShotAnimation(
            'Flow',
            autoplay: true,
          ),
        ],
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(child: Text(AppLocalizations.of(context)!.welcomeTo)),
            Flexible(
              flex: 2,
              child: Text("Flutter Travel",
                  style: Theme.of(context).textTheme.headlineLarge),
            ),
            LoginPage(),
          ],
        ),
      ),
    ]));
  }
}
