import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../localization/localization_constants.dart';
import '../util/color_util.dart';
import 'login_gradient_button.dart';

class LoginButton extends Container {
  LoginButton(this.isLoading, {Key? key, required this.onTap})
      : super(key: key);

  final Function() onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 50.0,
        decoration: GradientButtonDecoration(),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : const Text(
                  // getTranslated(context, "LOGIN_TITLE"),
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
