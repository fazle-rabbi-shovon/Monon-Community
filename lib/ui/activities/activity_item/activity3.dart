import 'package:flutter/material.dart';
import 'package:monon/Common/normal_button.dart';

import '../../../Common/text_input_field.dart';
import '../../../route/navigation_service.dart';
import '../../../util/color_util.dart';

class Activity3 extends StatefulWidget {
  const Activity3({super.key});

  @override
  State<Activity3> createState() => _Activity3State();
}

class _Activity3State extends State<Activity3> {
  final TextEditingController strengthController = TextEditingController();
  final TextEditingController weaknessController = TextEditingController();

  void _submitComment() {
    final firstAnswer = strengthController.text.trim();
    final secondAnswer = weaknessController.text.trim();
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "নিজের মানসিক শক্তি ও দুর্বলতা সম্পর্কে ধারণা থাকলে আত্মবিশ্বাস বাড়ে। "
              "নিচের ঘরগুলোতে নিজের তিনটি গুণ ও তিনটি দুর্বলতা সম্পর্কে লিখুন।",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "নিজের গুণাবলী",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextInputFieldComment(
                strengthController, "Add comment: 1, 2, 3", 3, 6),
            const SizedBox(height: 20),
            const Text(
              "নিজের দুর্বলতা",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextInputFieldComment(
                weaknessController, "Add comment: 1, 2, 3", 3, 6),
            const SizedBox(height: 20),
            NormalButton(false, "Submit", onTap: _submitComment),
          ],
        ),
      ),
    );
  }

  _appbar() {
    return AppBar(
      title: const Text(
        "নিজের মানসিক শক্তি এবং দুর্বলতাগুলো জানি",
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
