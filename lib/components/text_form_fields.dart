import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:line_icons/line_icons.dart';

/// [Controllers] are passed via arguments because if we used the [context] the 'confirm password' textfield would be sync with the 'password' textfield.
/// The [context] is used just for style purposes.

class TextFormFieldEmail extends TextFormField {
  TextFormFieldEmail(BuildContext context, {TextEditingController? controller})
      : super(
          controller: controller,
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

class TextFormFieldPassword extends TextFormField {
  TextFormFieldPassword(BuildContext context,
      {TextEditingController? controller,
      void Function()? onPressed,
      bool showPassword = false,
      String? labelText})
      : super(
          controller: controller,
          obscureText: !showPassword,
          decoration: InputDecoration(
            labelText: labelText ?? AppLocalizations.of(context)!.password,
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
