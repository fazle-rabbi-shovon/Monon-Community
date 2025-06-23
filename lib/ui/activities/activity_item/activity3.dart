import 'package:flutter/material.dart';
import 'package:monon/Common/normal_button.dart';

import '../../../Common/after_activity_dialogue.dart';
import '../../../Common/text_input_field.dart';
import '../../../firebase_call/save_activity.dart';
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

  void _submitComment() async {
    final strengthAnswer = strengthController.text.trim();
    final weaknessAnswer = weaknessController.text.trim();

    if (strengthAnswer.isEmpty && weaknessAnswer.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("সতর্কতা"),
          content: const Text("অনুগ্রহ করে অন্তত একটি ঘর পূরণ করুন।"),
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
      "1": "নিজের গুণাবলী : $strengthAnswer",
      "2": "নিজের দুর্বলতা : $weaknessAnswer",
    };

    try {
      await saveActivityOnFirebase(
        activityName: 'Activity3',
        activityData: activityData,
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
