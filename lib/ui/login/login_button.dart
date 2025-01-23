import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../localization/localization_constants.dart';
import '../../util/color_util.dart';
import 'gradient_button_decoration.dart';

class LoginButton extends Container {
  LoginButton({Key? key, required this.onTap}) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        width: 200,
        height: 50.0,
        decoration: GradientButtonDecoration(),
        // ignore: deprecated_member_use
          // style: ElevatedButton.styleFrom(
          //   backgroundColor: ColorUtil.button, // Set background color
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(10.0), // Set rounded corners
          //   ),
          // ),
          child: Center(
            child: Text(
              getTranslated(context, "LOGIN_TITLE"),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

      ),
    );
  }
}
