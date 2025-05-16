import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monon/Common/normal_button.dart';

import '../../../Common/normal_gradient_button_decoration.dart';
import '../../../Common/text_input_field.dart';
import '../../../route/navigation_service.dart';
import '../../../util/color_util.dart';
import '../../../util/dimen_values_util.dart';

class Activity2 extends StatefulWidget {
  const Activity2({super.key});

  @override
  State<Activity2> createState() => _Activity2State();
}

class _Activity2State extends State<Activity2> {
  final TextEditingController firstCommentController = TextEditingController();
  final TextEditingController secondCommentController = TextEditingController();

  @override
  void dispose() {
    firstCommentController.dispose();
    secondCommentController.dispose();
    super.dispose();
  }

  void _submitComment() {
    final firstAnswer = firstCommentController.text.trim();
    final secondAnswer = secondCommentController.text.trim();
    debugPrint('Response 1: $firstAnswer');
    debugPrint('Response 2: $secondAnswer');
    // Save to Firestore or local DB here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Your responses have been saved.')),
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
              "Activity- 2: আবেগের বিভিন্ন পরিস্থিতিতে আমি কী করি",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              "আবেগের বিভিন্ন পরিস্থিতিতে আমি কীভাবে আচরণ করি, তা ভিন্ন ভিন্ন এবং লিঙ্গি প্রতিটি অনুভূতির পেছনে কারণ থাকতে পারে। যে কোনো বিষয়ে সমাধান করা সহজতর হয়। আপনি যেমন অনুভব করছেন:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 12),
            const Center(
              child: Text(
                "😢",
                style: TextStyle(fontSize: 40),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "এই অনুভূতির সময়, এই পরিস্থিতিতে আপনি কী করেন, সাধারণত আপনার জন্য কী হয়।",
              style: TextStyle(fontSize: DimenValuesUtil.normalFontSize),
            ),
            const SizedBox(height: 8),
            TextInputFieldComment(firstCommentController, "Add comment", 3,6 ),
            const SizedBox(height: 16),
            const Text(
              "এই অনুভূতি আপনার শরীর ও মনে কোন প্রভাব ফেলেছে (যেমন: বুক ধড়ফড় করা, মাথাব্যথা, মন খালি খালি লাগা, মনমালিন্যতা অনুভব, নেতিবাচক চিন্তাধারা, ইনসোমনিয়া বা কোনো কিছু হতে পাড়া)? যদি প্রভাব না থাকে উত্তরটি “না” লিখুন।",
              style: TextStyle(fontSize: DimenValuesUtil.normalFontSize),
            ),
            const SizedBox(height: 8),
            TextInputFieldComment(secondCommentController, "Add comment", 3,6 ),
            const SizedBox(height: 20),
            NormalButton(false, "Submit", onTap: _submitComment),
          ],
        ),
      ),
    );
  }

  _appbar() {
    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(Icons.close, color: Colors.transparent),
          onPressed: () {},
        ),
      ],
      leading: Container(child: const Center()),
      title: const Text(
        "Activity 2: আবেগের বিভিন্ন পরিস্থিতিতে আমি কী করি",
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
