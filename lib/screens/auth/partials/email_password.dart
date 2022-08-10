import 'package:flutter/cupertino.dart';
import 'package:flutter_travel/components/text_fields.dart';

class EmailPassword extends StatelessWidget {
  const EmailPassword(
      {Key? key,
      this.onPressed,
      this.showPassword = false,
      this.emailController,
      this.passwordController})
      : super(key: key);

  final void Function()? onPressed;
  final bool showPassword;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldEmail(context, controller: emailController),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: TextFieldPassword(context,
              controller: passwordController,
              onPressed: onPressed,
              showPassword: showPassword),
        ),
      ],
    );
  }
}
