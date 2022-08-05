import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthSelectableText extends SelectableText {
  AuthSelectableText.rich(BuildContext context,
      {String? firstText, String? lastText, void Function()? onTap})
      : super.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: firstText,
                ),
                TextSpan(
                  text: lastText,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headlineMedium!.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            onTap: onTap,
            enableInteractiveSelection: false);
}
