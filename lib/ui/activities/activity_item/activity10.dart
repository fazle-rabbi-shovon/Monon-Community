import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Common/normail_button.dart';
import '../../../Common/text_input_field.dart';
import '../../../route/navigation_service.dart';
import '../../../util/color_util.dart';


class Activity10 extends StatefulWidget {

  const Activity10({super.key});
  @override
  State<Activity10> createState() => _Activity10State();
}

class _Activity10State extends State<Activity10> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  final TextEditingController commentControllerOne = TextEditingController();
  final TextEditingController commentControllerTwo = TextEditingController();

  void _submit() {
    debugPrint('Additional Comment: ${commentControllerOne.text}');
    debugPrint('Additional Comment: ${commentControllerTwo.text}');

    // Add Firestore or DB saving logic here

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Your responses have been saved.")),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Activity- 10: বর্তমান জীবনের নিয়ন্ত্রিত ও অনিয়ন্ত্রিত ঘটনা বা বিষয়বস্তুগুলো নিয়ে অবগত হই ",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "বর্তমানে যে ঘটনা বা বিষয়বস্তুগুলো আপনার নিয়ন্ত্রণে আছে এবং যা নিয়ন্ত্রণে নেই সেগুলো সম্পর্কে এখানে লিখুন (যেমন দ্রব্য মূল্য, ঘুম, ইত্যাদি যে কোন ঘটনা বা বিষয়)। এর মাধ্যমে আপনার "
                  "আত্মসচেতনতা বৃদ্ধি পাবে এবং আপনি নিজের অনুভূতিগুলোকে দৈনন্দিন জীবনের সকল কিছুর সাথে মানিয়ে নিতে পারবেন। ",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "বর্তমানে আপনার নিয়ন্ত্রণে যে বিষয়গুলো রয়েছে তার তালিকা",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextInputFieldComment(
                commentControllerOne, "Add comment", 2, 3),
            const SizedBox(height: 20),
            const Text(
              "বর্তমানে আপনার নিয়ন্ত্রণে যে বিষয়গুলো নেই তার তালিকা",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextInputFieldComment(
                commentControllerTwo, "Add comment", 2, 3),
            const SizedBox(height: 20),
            NormalButton(false, "Submit", onTap: _submit),
            const SizedBox(height: 40),
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
        "Activities 10",
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

