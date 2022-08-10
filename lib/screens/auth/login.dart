import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_travel/components/auth_selectable_text.dart';
import 'package:flutter_travel/screens/auth/partials/email_password.dart';
import 'package:flutter_travel/components/text_fields.dart';
import 'package:sizing/sizing.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, this.onPressedRegister}) : super(key: key);

  final void Function()? onPressedRegister;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
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
    return Column(
      children: [
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
              EmailPassword(
                emailController: _emailController,
                passwordController: _passwordController,
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
                showPassword: _showPassword,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SelectableText(
                    AppLocalizations.of(context)!.forgotPassword,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ElevatedButton(
            onPressed: () {
              print(_emailController.text);
            },
            child: Text(AppLocalizations.of(context)!.loginBtn),
          ),
        ),
        AuthSelectableText.rich(
          context,
          firstText: AppLocalizations.of(context)!.registerMessage,
          lastText: AppLocalizations.of(context)!.register,
          onTap: widget.onPressedRegister,
        ),
      ],
    );
  }
}
