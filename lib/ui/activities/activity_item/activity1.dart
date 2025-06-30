import 'package:flutter/material.dart';
import 'package:monon/Common/normal_button.dart';
import '../../../Common/after_activity_dialogue.dart';
import '../../../firebase_call/save_activity.dart';
import '../../../route/navigation_service.dart';
import '../../../util/color_util.dart';

class Activity1 extends StatefulWidget {
  const Activity1({super.key});
  @override
  State<Activity1> createState() => _Activity1State();
}

class _Activity1State extends State<Activity1> {
  final List<String> questions = [
    "১. আমার শখ",
    "২. আমার পেশা",
    "৩. আমার প্রিয় কাজ",
    "৪. আমার জীবনের প্রিয় মুহূর্ত",
    "৫. আমার প্রিয় মানুষ এবং কেন সে প্রিয়",
    "৬. আমার যে বৈশিষ্ট্য আমার ভালো লাগে",
    "৭. মানসিকভাবে আমার শক্তিশালী দিক",
    "৮. মানসিকভাবে আমার দুর্বল দিক",
    "৯. আমার মানসিক বৈশিষ্ট্যের যে দিকগুলো আমি পরিবর্তন করতে চাই ",
    "১০. আমার জীবনের লক্ষ্য"
  ];

  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(questions.length, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  bool _anyFieldFilled() {
    return controllers.any((controller) => controller.text.trim().isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: questions.length + 1,
          itemBuilder: (context, index) {
            if (index == questions.length) {
              return Column(
                children: [
                  const SizedBox(height: 20),
                  NormalButton(
                    false, // always enabled
                    "সাবমিট",
                    onTap: _submitAnswers,
                  ),
                ],
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "• ${questions[index]}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: controllers[index],
                  decoration: InputDecoration(
                    hintText: "Add comment",
                    hintStyle: TextStyle(color: Colors.grey.shade500),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 2, color: ColorUtil.button),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 2, color: ColorUtil.button),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 2, color: ColorUtil.button),
                    ),
                  ),
                  maxLines: 2,
                  minLines: 2,
                ),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: const Text(
        "নিজের সম্পর্কে জানি",
        style: TextStyle(color: Colors.white, fontSize: 18.0),
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

  void _submitAnswers() async {
    if (!_anyFieldFilled()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("সতর্কতা"),
          content: const Text("অনুগ্রহ করে সবগুলো ঘর পূরণ করুন"),
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

    Map<String, dynamic> activityData = {};
    for (int i = 0; i < questions.length; i++) {
      activityData["${i + 1}"] = "${questions[i].trim()} :  ${controllers[i].text.trim()}";
    }

    try {
      await saveActivityOnFirebase(
        activityName: 'Activity1',
        activityData: activityData,
        activityIndex: 0,
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

}
