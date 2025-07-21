import 'package:flutter/material.dart';
import 'package:monon/Common/text_editingfield_comment_enabled.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:monon/Common/normal_button.dart';
import '../../../Common/after_activity_dialogue.dart';
import '../../../Common/text_input_field.dart';
import '../../../firebase_call/save_activity.dart';
import '../../../route/navigation_service.dart';
import '../../../util/color_util.dart';
import '../../../util/dimen_values_util.dart';

class Activity8 extends StatefulWidget {
  const Activity8({super.key});

  @override
  State<Activity8> createState() => _Activity8State();
}

class _Activity8State extends State<Activity8> {
  final TextEditingController commentController = TextEditingController();
  final TextEditingController commentController2 = TextEditingController();
  bool _firstCommentSaved = false;

  @override
  void initState() {
    super.initState();
    _loadFirstComment();
  }

  Future<void> _loadFirstComment() async {
    final prefs = await SharedPreferences.getInstance();
    _firstCommentSaved = prefs.getBool('activity8_first_comment_saved') ?? false;

    if (_firstCommentSaved) {
      final saved = prefs.getString('activity8_first_comment') ?? '';
      commentController.text = saved;
    }

    setState(() {});
  }

  void _submitComment() async {
    final prefs = await SharedPreferences.getInstance();
    final first = commentController.text.trim();
    final second = commentController2.text.trim();

    if (!_firstCommentSaved) {
      if (first.isEmpty) {
        _showAlert("অনুগ্রহ করে প্রথম মন্তব্যটি পূরণ করুন।");
        return;
      }

      // Save first comment
      prefs.setString('activity8_first_comment', first);
      prefs.setBool('activity8_first_comment_saved', true);
      _firstCommentSaved = true;
    }

    if (second.isEmpty) {
      _showAlert("অনুগ্রহ করে দ্বিতীয় মন্তব্যটি পূরণ করুন।");
      return;
    }

    Map<String, dynamic> activityData = {
      "1": "সমমর্মিতা প্রকাশ : $first",
      "2": "সমমর্মিতা প্রকাশ : $second",
    };

    try {
      await saveActivityOnFirebase(
        activityName: 'Activity8',
        activityData: activityData,
        activityIndex: 7,
      );

      if (mounted) {
        showActivityDialog(success: true, context: context);
        commentController2.clear(); // clear second comment for repeat use
      }
    } catch (e) {
      if (mounted) {
        showActivityDialog(success: false, context: context, message: e.toString());
      }
    }
  }

  void _showAlert(String msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("সতর্কতা"),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("ঠিক আছে", style: TextStyle(color: ColorUtil.button)),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    commentController.dispose();
    commentController2.dispose();
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
            const SizedBox(height: 12),
            const Text(
              "সমানুভূতি বা সমমর্মিতা বা Empathy হলো সংবেদনশীলভাবে অন্য ব্যক্তির আবেগ-অনুভূতি বোঝা এবং তার অবস্থান বা দৃষ্টিকোণ থেকে কোন বিষয় দেখার ক্ষমতা। সমমর্মিতার মাধ্যমে পরস্পরের সাথে ইতিবাচক ও দৃঢ় সম্পর্ক গড়ে ওঠে।",
              style: TextStyle(fontSize: DimenValuesUtil.normalFontSize),
            ),
            const SizedBox(height: 8),
            const Text(
              "নিচের অংশটুকু পড়ুন এবং এই পরিস্থিতিতে আপনি কিভাবে অন্যের প্রতি আপনার সমানুভূতি বা সমমর্মিতা জানাবেন তা লিখুনঃ",
              style: TextStyle(fontSize: DimenValuesUtil.normalFontSize),
            ),
            const SizedBox(height: 8),
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
            const SizedBox(height: 10),
            TextInputFieldCommentEnabled(
              commentController,
              "আপনার উত্তর লিখুন",
              2,
              3,
              enabled: !_firstCommentSaved,
            ),
            const SizedBox(height: 20),
            const Text(
              "সমানুভূতি বা সমমর্মিতা চর্চা করুন। "
                  "\nআজ আপনি অন্যদের প্রতি কিভাবে আপনার সমানুভূতি বা সমমর্মিতা প্রকাশ করেছেন তা লিখুন।",
              style: TextStyle(fontSize: DimenValuesUtil.normalFontSize),
            ),
            const SizedBox(height: 10),
            TextInputFieldComment(commentController2, "আপনার উত্তর লিখুন", 2, 3),
            const SizedBox(height: 20),
            NormalButton(false, "সাবমিট", onTap: _submitComment),
          ],
        ),
      ),
    );
  }

  _appbar() {
    return AppBar(
      title: const Text(
        "সমানুভূতি বা সমমর্মিতার চর্চা করি",
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
