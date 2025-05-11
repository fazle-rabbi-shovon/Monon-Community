import 'package:flutter/material.dart';
import 'package:monon/Common/normail_button.dart';
import '../../../Common/text_input_field.dart';
import '../../../util/color_util.dart';
import '../../../util/dimen_values_util.dart';

class Activity8 extends StatefulWidget {
  const Activity8({super.key});

  @override
  State<Activity8> createState() => _Activity8State();
}

class _Activity8State extends State<Activity8> {
  final TextEditingController commentController = TextEditingController();

  void _submitComment() {
    final response = commentController.text.trim();
    debugPrint('Activity 8 Response: $response');
    // Save to Firestore or local DB here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Your response has been saved.')),
    );
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
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
              "Activity-8: সমানুভূতি বা সমমর্মিতার চর্চা করি",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              "সমানুভূতি বা সমমর্মিতা বা Empathy হলো সংবেদনশীলভাবে অন্য ব্যক্তির আবেগ-অনুভূতি বোঝা এবং তার অবস্থান বা দৃষ্টিকোণ থেকে কোন বিষয় দেখার ক্ষমতা। সমমর্মিতার মাধ্যমে পরস্পরের সাথে ইতিবাচক ও দৃঢ় সম্পর্ক গড়ে ওঠে। নিচের অংশটুকু পড়ুন এবং এই পরিস্থিতিতে আপনি কিভাবে অন্যের প্রতি আপনার সমানুভূতি বা সমমর্মিতা জানাবেন তা লিখুনঃ ",
              style: TextStyle(fontSize: DimenValuesUtil.normalFontSize),
            ),
            const SizedBox(height: 16),
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  TextSpan(
                    text: 'পরিস্থিতিঃ ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '“গতকালের প্রচণ্ড ঝড়-বৃষ্টিতে আমার নতুন তোলা ঘরটা ভেঙ্গে গেছে। এক মাসও হয়নি ঘরটা তৈরি করেছিলাম”।',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            TextInputFieldComment(commentController, "Add comment", 2, 3),
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
        "Activity-8",
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
