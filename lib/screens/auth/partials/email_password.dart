import 'package:flutter/cupertino.dart';
import 'package:flutter_travel/components/text_form_fields.dart';

class EmailPassword extends StatelessWidget {
  const EmailPassword({
    Key? key,
    this.onPressed,
    this.showPassword = false,
  }) : super(key: key);

  final void Function()? onPressed;
  final bool showPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormFieldEmail(context,
            controller: EmailPasswordControllers.of(context).emailController),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: TextFormFieldPassword(context,
              controller:
                  EmailPasswordControllers.of(context).passwordController,
              onPressed: onPressed,
              showPassword: showPassword),
        ),
      ],
    );
  }
}

/// Used so that the password and email fields can have the same text in the different auth widgets.
class EmailPasswordControllers extends InheritedWidget {
  EmailPasswordControllers(
      {required Widget child, this.emailController, this.passwordController})
      : super(child: child);

  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  static EmailPasswordControllers of(BuildContext context) {
    final EmailPasswordControllers? result =
        context.dependOnInheritedWidgetOfExactType<EmailPasswordControllers>();
    assert(result != null, 'No EmailPasswordControllers found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return oldWidget != this;
  }
}
