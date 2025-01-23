import 'package:flutter/material.dart';

import '../../route/navigation_service.dart';
import '../../util/color_util.dart';

// ignore: must_be_immutable
class CommonDialog extends StatelessWidget {
  final String? title;
  final Color? titleColor;
  final bool? titleWeight;
  final String description;
  final TextAlign? descriptionAlign;
  void Function()? button1Func;
  final Color? button1Color;
  final String? button1;
  final String? button2;
  void Function()? button2Func;
  final Color? button2Color;
  final bool? button1Flag;
  final bool? button2Flag;

  CommonDialog({
    this.title,
    this.titleColor,
    this.titleWeight,
    required this.description,
    this.descriptionAlign,
    this.button1,
    this.button2,
    this.button1Func,
    this.button1Color,
    this.button2Func,
    this.button2Color,
    this.button1Flag,
    this.button2Flag,
  });

  @override
  Widget build(BuildContext context) {
    void popFalse() {
      NavigationService.getCurrentState()
          ?.pop(false);
    }

    void popTrue() {
      NavigationService.getCurrentState()
          ?.pop(true);
    }

    return AlertDialog(
      title: (title != null)
          ? Text(
              title!,
              style: TextStyle(
                  fontSize: 22.0,
                  color: titleColor,
                  fontWeight: titleWeight == null
                      ? null
                      : titleWeight!
                          ? FontWeight.bold
                          : null),
            )
          : null,
      content: Text(
        description,
        textAlign: descriptionAlign,
        style: TextStyle(
            fontSize: 18.0,
            color: ColorUtil.primary),
      ),
      actions: <Widget>[
        if (button2 != null)
          TextButton(
            onPressed: button2Flag == null
                ? button2Func
                : button2Flag!
                    ? popTrue
                    : popFalse,
            child: Text(
              button2!,
              style: TextStyle(
                  color: button2Color,
                  fontWeight: FontWeight.w600),
            ),
          ),
        if (button1 != null)
          TextButton(
            onPressed: button1Flag == null
                ? button1Func
                : button1Flag!
                    ? popTrue
                    : popFalse,
            child: Text(
              button1!,
              style: TextStyle(
                  color: button1Color,
                  fontWeight: FontWeight.w600),
            ),
          ),
      ],
    );
  }
}
