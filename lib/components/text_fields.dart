import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:line_icons/line_icons.dart';

class TextFieldEmail extends TextField {
  TextFieldEmail(BuildContext context)
      : super(
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
        );
}

class TextFieldPassword extends TextField {
  TextFieldPassword(BuildContext context,
      {VoidCallback? onPressed, showPassword = false})
      : super(
          obscureText: !showPassword,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.password,
            labelStyle: Theme.of(context).textTheme.labelMedium,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Color(0xff087CF2),
              ),
            ),
            suffixIcon: IconButton(
              icon:
                  showPassword ? Icon(LineIcons.eye) : Icon(LineIcons.eyeSlash),
              onPressed: onPressed,
            ),
          ),
        );
}