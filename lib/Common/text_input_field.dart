import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../localization/localization_constants.dart';
import '../util/color_util.dart';
import '../util/dimen_values_util.dart';
import 'login_gradient_button_decoration.dart';

class TextInputFieldComment extends Container {
  TextInputFieldComment(this.textEditingController, this.labelText, this.minimumLine, this.maximumLine, {super.key});

  final TextEditingController textEditingController;
  final String labelText;
  final int minimumLine;
  final int maximumLine;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey.shade500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 2, color: ColorUtil.button),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 2, color: ColorUtil.button),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 2, color: ColorUtil.button),
        ),
      ),
      minLines: minimumLine,
      maxLines: maximumLine,
    );
  }
}
