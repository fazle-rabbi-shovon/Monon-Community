import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:monon/Common/normal_button.dart';
import '../../../Common/after_activity_dialogue.dart';
import '../../../Common/text_input_field.dart';
import '../../../firebase_call/save_activity.dart';
import '../../../route/navigation_service.dart';
import '../../../util/color_util.dart';

class FinalTask extends StatefulWidget {
  const FinalTask({super.key});

  @override
  State<FinalTask> createState() => _FinalTaskState();
}

class _FinalTaskState extends State<FinalTask> {
  final TextEditingController goodIdeaController = TextEditingController();
  final TextEditingController explanationController = TextEditingController();

  void _submitFinalTask() async {
    final idea = goodIdeaController.text.trim();
    final explanation = explanationController.text.trim();

    if (idea.isEmpty || explanation.isEmpty) {
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

    Map<String, dynamic> activityData = {
      "1": "ভাল ধারণা বা বিষয়: $idea",
      "2": "বিস্তারিত ব্যাখ্যা: $explanation",
    };

    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        throw Exception('User not logged in');
      }

      final now = DateTime.now();
      final formattedDate =
          "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

      final firestore = FirebaseFirestore.instance;

      // Fixed document ID per activity per day
      final docRef  = firestore
          .collection('final_activity')
          .doc(uid)
          .collection(formattedDate);
          // .doc(activityName) // always overwrite or check this
          // .collection('entries');


      await docRef.add({
        ...activityData,
        'savedAt': FieldValue.serverTimestamp(),
      });


      if (mounted) {
        showActivityDialog(success: true, context: context);
      }
    } catch (e) {
      if (mounted) {
        showActivityDialog(success: false, context: context, message: e.toString());
      }
    }
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
              "নিজেকে ভালো রাখার জন্য আলোচ্য বিষয়বস্তুগুলো থেকে যে কোন একটি ভালো বিষয় বা ধারণা শিখেছেন তা সম্পর্কে লিখুন। "
                  "উক্ত বিষয়টি প্রতিদিন চর্চা করার জন্য আপনি কিভাবে প্রতিজ্ঞাবদ্ধ সে সম্পর্কে বিস্তারিত লিখুন "
                  "(যেমন আপনার ভাবনা, যাদের সাথে করবেন, কিভাবে করবেন, যেভাবে প্রকাশ করবেন, কতবার করবেন)।",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "যে ভাল ধারণা বা বিষয়টি শিখেছি",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextInputFieldComment(goodIdeaController, "Add comment", 3, 6),
            const SizedBox(height: 20),
            const Text(
              "আমার ভাল ধারণা বা বিষয় সম্পর্কে লিখিঃ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            const Text(
              "আমার ভাবনা, যাদের সাথে করবো, কিভাবে করবো, যেভাবে প্রকাশ করবো, কতবার করবো",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
            ),
            const SizedBox(height: 8),
            TextInputFieldComment(explanationController, "Add comment", 3, 6),
            const SizedBox(height: 20),
            NormalButton(false, "Submit", onTap: _submitFinalTask),
          ],
        ),
      ),
    );
  }

  _appbar() {
    return AppBar(
      title: const Text(
        "নিজের জীবনের জন্য কিছু পরিকল্পনা করা",
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
