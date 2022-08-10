import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_travel/components/auth_selectable_text.dart';
import 'package:flutter_travel/screens/auth/partials/email_password.dart';
import 'package:flutter_travel/components/text_form_fields.dart';
import 'package:sizing/sizing.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, this.onPressedRegister}) : super(key: key);

  final void Function()? onPressedRegister;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _showPassword = false;
  bool _showConfirmPassword = false;

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
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
                showPassword: _showPassword,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormFieldPassword(
                  context,
                  onPressed: () {
                    setState(() {
                      _showConfirmPassword = !_showConfirmPassword;
                    });
                  },
                  showPassword: _showConfirmPassword,
                  labelText: AppLocalizations.of(context)!.confirmPassword,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(AppLocalizations.of(context)!.registerBtn),
          ),
        ),
        AuthSelectableText.rich(
          context,
          firstText: AppLocalizations.of(context)!.loginMessage,
          lastText: AppLocalizations.of(context)!.login,
          onTap: widget.onPressedRegister,
        ),
      ],
    );
  }
}
