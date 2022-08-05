import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_travel/components/auth_selectable_text.dart';
import 'package:flutter_travel/components/text_fields.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizing/sizing.dart';
import 'package:rive/rive.dart';

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
            Container(
              margin: const EdgeInsets.only(top: 20),
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
                  TextFieldEmail(context),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: TextFieldPassword(context, onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    }, showPassword: _showPassword),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SelectableText(
                        "Forgot password?",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(AppLocalizations.of(context)!.login),
              ),
            ),
            AuthSelectableText.rich(
              context,
              firstText: AppLocalizations.of(context)!.signUpMessage,
              lastText: AppLocalizations.of(context)!.signUp,
              onTap: () {
                print("data");
              },
            ),
          ],
        ),
      ),
    ]));
  }
}
