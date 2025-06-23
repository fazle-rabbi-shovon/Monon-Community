import 'package:flutter/material.dart';

import '../route/navigation_service.dart';
import '../util/color_util.dart';

void showActivityDialog({
  required bool success,
  required BuildContext context,
  String? message,
}) {

  const defaultMessage = "দুঃখিত, তথ্য সংরক্ষণ করা যায়নি।";

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        success ? "সফল হয়েছে" : "সফল হয়নি",
        style: TextStyle(
          color: success ? Colors.green : Colors.red,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Text(
        success ? "আপনার তথ্য সফলভাবে সংরক্ষণ করা হয়েছে।" : message ?? defaultMessage,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            NavigationService.getCurrentState()?.pop();
          },
          child: const Text("ঠিক আছে", style: TextStyle(color: ColorUtil.button)),
        )
      ],
    ),
  );
}
