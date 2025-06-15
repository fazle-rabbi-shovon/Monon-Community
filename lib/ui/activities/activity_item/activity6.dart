import 'package:flutter/material.dart';
import 'package:monon/Common/normal_button.dart';
import '../../../Common/text_input_field.dart';
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

  void _submitComment() {
    final response = commentController.text.trim();
    debugPrint('Activity 6 Response: $response');
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
            const SizedBox(height: 12),
            const Text(
              "আপনার পছন্দের বা প্রিয় একজন মানুষের তিনটি গুণ মনে মনে ভাবুন ও লিখুন এবং উক্ত গুণাবলী নিজের মধ্যে আয়ত্ত করার চেষ্টা করুন। এর ফলে আপনি মানসিকভাবে আরও বিকশিত হবেন।",
              style: TextStyle(fontSize: DimenValuesUtil.normalFontSize),
            ),
            const SizedBox(height: 16),
            TextInputFieldComment(commentController, "Add comment: 1, 2, 3", 3, 5),
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
