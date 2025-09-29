import 'package:flutter/material.dart';
import 'package:monon/util/color_util.dart';

class ConfirmHelpDialog extends StatelessWidget {
  const ConfirmHelpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text(
        "আপনি কি মনে করছেন যে আপনি বর্তমানে দুঃখ, উদ্বেগ, চাপ বা কোনো মানসিক কষ্ট অনুভব করছেন, যার জন্য আপনি মানসিক সহায়তা পেতে চান?",
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true); // না চাপ দিলে false
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.red, // টেক্সট কালার
          ),
          child: const Text("না"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(true); // হ্যাঁ চাপ দিলে true
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorUtil.primary, // ব্যাকগ্রাউন্ড কালার
            foregroundColor: Colors.white, // টেক্সট কালার
          ),
          child: const Text("হ্যাঁ"),
        ),
      ],
    );
  }
}
