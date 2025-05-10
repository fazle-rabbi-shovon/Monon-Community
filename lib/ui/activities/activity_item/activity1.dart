import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monon/Common/normail_button.dart';

import '../../../Common/normal_gradient_button_decoration.dart';
import '../../../route/navigation_service.dart';
import '../../../util/color_util.dart';
import '../../../util/dimen_values_util.dart';


class Activity1 extends StatefulWidget {

  const Activity1({super.key});
  @override
  State<Activity1> createState() => _Activity1State();
}

class _Activity1State extends State<Activity1> {
  final TextEditingController commentController = TextEditingController();

  final List<String> questions = [
    "১. আমার নাম",
    "২. আমার পছন্দ",
    "৩. আমার প্রিয় মানুষ",
    "৪. আমার জীবনের প্রিয় মুহূর্ত",
    "৫. আমার প্রিয় মানুষ এবং কেন সে প্রিয়",
    "৬. আমার কে (শৈশব) আমাকে অনুপ্রাণিত করেছে",
    "৭. আমার জীবনের সবচেয়ে ভালো দিক",
    "৮. আমার সবচেয়ে খারাপ দিক",
    "৯. আমি আমার মানসিক স্বাস্থ্য বা পরিবেশে কী পরিবর্তন করতে চাই",
    "১০. আমার জীবনের লক্ষ্য"
  ];

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  void _submitComment() {
    final answer = commentController.text.trim();
    debugPrint('User comment: $answer');
    // Save to Firestore or local DB here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Your response has been saved.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Activity-1: নিজের সম্পর্কে জানি",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              "নিচের প্রশ্নগুলোর উত্তর দিন (যতগুলি পারেন):",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            for (var question in questions)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text("• $question",
                  style: const TextStyle(fontSize: DimenValuesUtil.normalFontSize, fontWeight: FontWeight.normal),),
              ),
            const SizedBox(height: 20),
            TextField(
              controller: commentController,
              decoration: InputDecoration(
                labelText: "Write your answers here...",
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
              maxLines: 15,
              minLines: 5,
            ),
            const SizedBox(height: 20),
            NormalButton(false, "Submit", onTap: _submitComment)
            // ElevatedButton(
            //   onPressed: _submitComment,
            //   child: const Text("Submit"),
            // )
          ],
        ),
      ),
    );
  }

  _appbar() {
    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.transparent,
          ),
          onPressed: () {},
        ),
      ],
      leading: Container(
        child: const Center(),
      ),
      title: const Text(
        // getTranslated(context, "LEAVE_APPLY"),
        "Activity 1: নিজের সম্পর্কে আমি",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
      backgroundColor: ColorUtil.primary,
      iconTheme: const IconThemeData(color: Colors.white),
      elevation: 0,
      centerTitle: true,
    );
  }
}

