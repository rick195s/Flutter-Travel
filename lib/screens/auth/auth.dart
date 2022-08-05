import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_travel/screens/auth/login.dart';
import 'package:rive/rive.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late Widget _currentWidget;

  @override
  void initState() {
    super.initState();
    _currentWidget = LoginPage(onPressedRegister: () {
      setState(() {
        _currentWidget = Text("dqwdwqqd");
      });
    });
  }

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
            PageTransitionSwitcher(
                reverse: true,
                duration: const Duration(milliseconds: 1000),
                child: _currentWidget,
                transitionBuilder: (child, animation, secondaryAnimation) =>
                    SharedAxisTransition(
                        child: child,
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.horizontal)),
          ],
        ),
      ),
    ]));
  }
}
