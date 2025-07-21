import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Common/after_activity_dialogue.dart';
import '../../../Common/normal_button.dart';
import '../../../Common/text_input_field.dart';
import '../../../firebase_call/save_activity.dart';
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

  void _submit() async {
    final controlList = commentControllerOne.text.trim();
    final notControlList = commentControllerTwo.text.trim();

    Map<String, dynamic> activityData = {
      "1": "নিয়ন্ত্রণে থাকা বিষয় : ${controlList.isEmpty ? "Not provided" : controlList}",
      "2": "নিয়ন্ত্রণে নেই এমন বিষয় : ${notControlList.isEmpty ? "Not provided" : notControlList}",
    };

    final hasInput = activityData.values.every((value) => value != "Not provided");

    if (!hasInput) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("সতর্কতা"),
          content: const Text("অনুগ্রহ করে সবগুলো ঘর পূরণ করুন।"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("ঠিক আছে", style: TextStyle(color: ColorUtil.button)),
            )
          ],
        ),
      );
      return;
    }

    try {
      await saveActivityOnFirebase(
        activityName: 'Activity10',
        activityData: activityData,
        activityIndex: 9,
      );

      if (mounted) {
        showActivityDialog(success: true, context: context);
      }
    } catch (e) {
      if(mounted){
        showActivityDialog(success: false, context: context, message: e.toString());
      }
    }
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
            const SizedBox(height: 10),
            const Text(
              "বর্তমানে যে ঘটনা বা বিষয়বস্তুগুলো আপনার নিয়ন্ত্রণে আছে এবং যা নিয়ন্ত্রণে নেই সেগুলো সম্পর্কে এখানে লিখুন (যেমন দ্রব্য মূল্য, ঘুম, ইত্যাদি যে কোন ঘটনা বা বিষয়)। এর মাধ্যমে আপনার আত্মসচেতনতা বৃদ্ধি পাবে এবং আপনি নিজের অনুভূতিগুলোকে দৈনন্দিন জীবনের সকল কিছুর সাথে মানিয়ে নিতে পারবেন।",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "বর্তমানে আপনার নিয়ন্ত্রণে যে বিষয়গুলো রয়েছে তার তালিকা",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextInputFieldComment(
                commentControllerOne, "আপনার উত্তর লিখুন", 2, 3),
            const SizedBox(height: 20),
            const Text(
              "বর্তমানে আপনার নিয়ন্ত্রণে যে বিষয়গুলো নেই তার তালিকা",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextInputFieldComment(
                commentControllerTwo, "আপনার উত্তর লিখুন", 2, 3),
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
      title: const Text(
        // getTranslated(context, "LEAVE_APPLY"),
        "বর্তমান জীবনের নিয়ন্ত্রিত ও অনিয়ন্ত্রিত ঘটনা বা বিষয়বস্তুগুলো নিয়ে অবগত হই ",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
      centerTitle: true,
      backgroundColor: ColorUtil.primary,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          NavigationService.getCurrentState()?.pop();
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            NavigationService.getCurrentState()?.pop();
          },
        ),
      ],
    );
  }
}

