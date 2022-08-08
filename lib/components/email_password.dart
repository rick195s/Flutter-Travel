import 'package:flutter/cupertino.dart';
import 'package:flutter_travel/components/text_fields.dart';

class EmailPassword extends StatelessWidget {
  const EmailPassword({Key? key, this.onPressed, this.showPassword = false})
      : super(key: key);

  final void Function()? onPressed;
  final bool showPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldEmail(context),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: TextFieldPassword(context,
              onPressed: onPressed, showPassword: showPassword),
        ),
      ],
    );
  }
}
