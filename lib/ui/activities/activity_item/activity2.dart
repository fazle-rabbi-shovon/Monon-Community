import 'package:flutter/material.dart';
import 'package:monon/Common/normal_button.dart';

import '../../../Common/after_activity_dialogue.dart';
import '../../../Common/text_input_field.dart';
import '../../../firebase_call/save_activity.dart';
import '../../../route/navigation_service.dart';
import '../../../util/color_util.dart';
import '../../../util/dimen_values_util.dart';
import '../../feelings/emotion_storage.dart';
import '../../feelings/user_emotion_enum.dart';

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

  void _submitComment() async {
    final firstAnswer = firstCommentController.text.trim();
    final secondAnswer = secondCommentController.text.trim();

    if (firstAnswer.isEmpty && secondAnswer.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("সতর্কতা"),
          content: const Text("অনুগ্রহ করে অন্তত একটি উত্তর দিন।"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("ঠিক আছে",
                  style: TextStyle(color: ColorUtil.button)),
            )
          ],
        ),
      );
      return;
    }

    Map<String, dynamic> activityData = {
      "1": "এই অনুভূতির কারণ ও ব্যবস্থাপনা : $firstAnswer",
      "2": "শরীর ও মনের উপর প্রভাব : $secondAnswer",
    };

    try {
      await saveActivityOnFirebase(
        activityName: 'Activity2',
        activityData: activityData,
      );

      if (mounted) {
        showActivityDialog(success: true, context: context);
      }
    } catch (e) {
      if (mounted) {
        showActivityDialog(
            success: false, context: context, message: e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: FutureBuilder<UserEmotion?>(
        future: EmotionStorage.loadEmotion(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final emotion = snapshot.data!;
          final emotionImageMap = {
            UserEmotion.anxious: 'assets/images/emg_anxious.png',
            UserEmotion.scared: 'assets/images/emg_shock.png',
            UserEmotion.angry: 'assets/images/emg_angry.png',
            UserEmotion.sad: 'assets/images/emg_sad.png',
            UserEmotion.annoyed: 'assets/images/emg_neutral.png',
            UserEmotion.happy: 'assets/images/emg_happy.png',
          };

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                const SizedBox(height: 12),
                const Text(
                  "আবেগজনিত বিভিন্ন পরিস্থিতিতে আমি কীভাবে আচরণ করি, তা চিন্তা করি এবং লেখি। প্রতিটি অনুভূতির পিছনের কারণ বুঝতে পারলে যে কোন বিষয় সমাধান করা সহজ হবে।",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Image.asset(
                    emotionImageMap[emotion]!,
                    height: 60,
                    width: 60,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "এই অনুভূতির কারণ, এই পরিস্থিতিতে আপনি কি করেন, নিয়ন্ত্রণে রাখার জন্য কি করেন।",
                  style: TextStyle(fontSize: DimenValuesUtil.normalFontSize),
                ),
                const SizedBox(height: 8),
                TextInputFieldComment(
                    firstCommentController, "Add comment", 3, 6),
                const SizedBox(height: 16),
                const Text(
                  "এই অনুভূতিটি আপনার শরীর ও মনে কোন প্রভাব ফেলেছে (যেমন: বুক ভারী লাগা, মাথাব্যথা, হাত কাঁপা, অস্থির লাগা, মনোযোগের অভাব, নেতিবাচক চিন্তা-ভাবনা, ইত্যাদি যে কোন কিছু হতে পারে)? কোন প্রভাব না ফেললে উত্তরটি “না” লিখুন।",
                  style: TextStyle(fontSize: DimenValuesUtil.normalFontSize),
                ),
                const SizedBox(height: 8),
                TextInputFieldComment(
                    secondCommentController, "Add comment", 3, 6),
                const SizedBox(height: 20),
                NormalButton(false, "সাবমিট", onTap: _submitComment),
              ],
            ),
          );
        },
      ),
    );
  }

  _appbar() {
    return AppBar(
      title: const Text(
        "আবেগের বিভিন্ন পরিস্থিতিতে আমি কী করি",
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
