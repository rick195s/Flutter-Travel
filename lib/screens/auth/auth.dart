import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_travel/screens/auth/login.dart';
import 'package:flutter_travel/screens/auth/partials/email_password.dart';
import 'package:flutter_travel/screens/auth/register.dart';
import 'package:rive/rive.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late Widget _currentWidget;
  late LoginPage loginPage;
  late RegisterPage registerPage;

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    loginPage = new LoginPage(
      onPressedRegister: () => setState(() {
        _currentWidget = registerPage;
      }),
    );

    registerPage = new RegisterPage(
      onPressedRegister: () => setState(() {
        _currentWidget = loginPage;
      }),
    );

    _currentWidget = loginPage;
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
            EmailPasswordControllers(
              emailController: _emailController,
              passwordController: _passwordController,
              child: PageTransitionSwitcher(
                  reverse: true,
                  duration: const Duration(milliseconds: 750),
                  child: _currentWidget,
                  transitionBuilder: (child, animation, secondaryAnimation) =>
                      SharedAxisTransition(
                          child: child,
                          animation: animation,
                          secondaryAnimation: secondaryAnimation,
                          transitionType: SharedAxisTransitionType.horizontal)),
            ),
          ],
        ),
      ),
    ]));
  }
}
