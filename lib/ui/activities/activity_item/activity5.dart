import 'package:flutter/material.dart';
import 'package:monon/Common/normal_button.dart';
import '../../../Common/after_activity_dialogue.dart';
import '../../../Common/text_input_field.dart';
import '../../../firebase_call/save_activity.dart';
import '../../../route/navigation_service.dart';
import '../../../util/color_util.dart';
import '../../../util/image_util.dart';

class Activity5 extends StatefulWidget {
  const Activity5({super.key});

  @override
  State<Activity5> createState() => _Activity5State();
}

class _Activity5State extends State<Activity5> {
  final TextEditingController relationshipController = TextEditingController();

  void _submitComment() async {
    final relationData = relationshipController.text.trim();

    if (relationData.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("সতর্কতা"),
          content: const Text("অনুগ্রহ করে মন্তব্যের ঘরটি পূরণ করুন।"),
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
      "1": "সম্পর্কের গাছ অনুশীলন : $relationData",
    };

    try {
      await saveActivityOnFirebase(
        activityName: 'Activity5',
        activityData: activityData,
        activityIndex: 4,
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
            const SizedBox(height: 12),
            const Text(
              "এটি একটি সম্পর্কের গাছ এর ছবি। এমন মানুষদের কথা চিন্তা করুন ও লিখুন যাদের আপনি নিজের "
                  "কাছের মানুষ মনে করেন এবং যারা সব সময় আপনার পাশে থাকেন। এটি যে কোন সম্পর্ক হতে"
                  " পারে। এক্ষেত্রে মানুষের নাম বা সম্পর্কের নাম, যে কোন একটি উল্লেখ করতে পারবেন। "
                  "যদি আপনি মানুষটির নাম বা সম্পর্কের নাম কোনটি উল্লেখ করতে না চান তাহলে শুধু সংখ্যার "
                  "মাধ্যমে এমন কতজন কাছের মানুষ আছেন তার মোট সংখ্যা উল্লেখ করুন। এই "
                  "অনুশীলনটি একটি সুন্দর পারষ্পরিক সম্পর্ক বজায় রাখার দক্ষতা বাড়াতে আপনাকে সাহায্য করবে।",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "সম্পর্কের গাছ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Center(
              child: Image.asset(
                ImageUtil.RELATIONSHIP_TREE,
                // key: const Key('logo-image'),
                width: 250,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            TextInputFieldComment(
              relationshipController,
              "আপনার উত্তর লিখুন",
              4,
              10,
            ),
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
        "কাছের মানুষের প্রতি সচেতনতা বাড়াই ও যত্নশীল হই",
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
}
