import 'package:flutter/material.dart';
import 'package:monon/Common/normal_button.dart';
import '../../../Common/after_activity_dialogue.dart';
import '../../../Common/text_input_field.dart';
import '../../../firebase_call/save_activity.dart';
import '../../../route/navigation_service.dart';
import '../../../util/color_util.dart';
import '../../../util/dimen_values_util.dart';

class Activity6 extends StatefulWidget {
  const Activity6({super.key});

  @override
  State<Activity6> createState() => _Activity6State();
}

class _Activity6State extends State<Activity6> {
  final TextEditingController commentController = TextEditingController();
  final TextEditingController commentController1 = TextEditingController();
  final TextEditingController commentController2 = TextEditingController();

  void _submitComment() async {
    final response = commentController.text.trim();
    final response1 = commentController1.text.trim();
    final response2 = commentController2.text.trim();

    if (response.isEmpty || response1.isEmpty || response2.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("সতর্কতা"),
          content: const Text("অনুগ্রহ করে মন্তব্যের ঘর সবগুলো পূরণ করুন।"),
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
      "1": "প্রিয় মানুষের ৩টি গুণ : $response",
      "2": "প্রিয় মানুষের ৩টি গুণ : $response1",
      "3": "প্রিয় মানুষের ৩টি গুণ : $response2",
    };

    try {
      await saveActivityOnFirebase(
        activityName: 'Activity6',
        activityData: activityData,
        activityIndex: 5,
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
            const SizedBox(height: 12),
            const Text(
              "আপনার পছন্দের বা প্রিয় একজন মানুষের তিনটি গুণ মনে মনে ভাবুন ও লিখুন এবং উক্ত গুণাবলী নিজের মধ্যে আয়ত্ত করার চেষ্টা করুন। এর ফলে আপনি মানসিকভাবে আরও বিকশিত হবেন।",
              style: TextStyle(fontSize: DimenValuesUtil.normalFontSize),
            ),
            const SizedBox(height: 16),
            TextInputFieldComment(commentController, "আপনার উত্তর লিখুন", 1, 2),
            const SizedBox(height: 10),
            TextInputFieldComment(commentController1, "আপনার উত্তর লিখুন", 1, 2),
            const SizedBox(height: 10),
            TextInputFieldComment(commentController2, "আপনার উত্তর লিখুন", 1, 2),
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
        "অন্যদের ভালো গুণাবলীগুলোকে রপ্ত করি",
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
