import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../localization/localization_constants.dart';
import '../util/color_util.dart';
import '../util/dimen_values_util.dart';
import 'login_gradient_button_decoration.dart';

class NormalButton extends Container {
  NormalButton(this.isLoading, this.buttonText, {Key? key, required this.onTap})
      : super(key: key);

  final bool isLoading;
  final String buttonText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 20.0),
        width:  double.infinity,
        height: 50.0,
        decoration: GradientButtonDecoration(),
        // decoration: const BoxDecoration(
        //     borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //   color: Colors.white,
        // ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(
                  buttonText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: DimenValuesUtil.normalFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
