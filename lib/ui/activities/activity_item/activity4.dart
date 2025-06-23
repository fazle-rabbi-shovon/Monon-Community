import 'package:flutter/material.dart';
import 'package:monon/Common/normal_button.dart';
import '../../../Common/after_activity_dialogue.dart';
import '../../../Common/text_input_field.dart';
import '../../../firebase_call/save_activity.dart';
import '../../../route/navigation_service.dart';
import '../../../util/color_util.dart';

class Activity4 extends StatefulWidget {
  const Activity4({super.key});

  @override
  State<Activity4> createState() => _Activity4State();
}

class _Activity4State extends State<Activity4> {

  final List<String> negativeStatements = [
    "আমি তো কিছুই করতে পারছি না",
    "আমি কেমনে কী করব?",
    "আমাকে দিয়ে কখনোই কিছু হবে না",
    "এটা অসম্ভব বা এটা একেবারেই সম্ভব না",
    "আমি কোন কিছুই সহজভাবে মেনে নিতে পারছিনা",
    "আমার অনেক বেশি টেনশন হচ্ছে",
  ];

  final List<String> positiveStatements = [
    "আমি প্রতিদিনই কিছু করছি",
    "আমি সবকিছু পরিকল্পিতভাবে করছি। আমি পারবো।",
  ];
  // Controllers for each row's input
  final List<TextEditingController> negativeControllers =
  List.generate(6, (_) => TextEditingController());
  final List<TextEditingController> positiveControllers =
  List.generate(6, (_) => TextEditingController());

  final TextEditingController commentController = TextEditingController();

  // void _submit() {
  //   for (int i = 0; i < 6; i++) {
  //     debugPrint(
  //         'Row ${i + 1}: Negative: ${negativeControllers[i].text} | Positive: ${positiveControllers[i].text}');
  //   }
  //   debugPrint('Additional Comment: ${commentController.text}');
  //
  //   // Add Firestore or DB saving logic here
  //
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(content: Text("Your responses have been saved.")),
  //   );
  // }

  void _submit() async {
    final additionalComment = commentController.text.trim();

    // Build activity data map
    Map<String, dynamic> activityData = {};

    // Collect 4 editable fields (positive thoughts for rows 3–6)
    for (int i = 2; i < 6; i++) {
      final positiveText = positiveControllers[i].text.trim();
      activityData["Positive Thought ${i + 1}"] = positiveText.isEmpty ? "Not provided" : positiveText;
    }

    // Add final comment
    activityData["Extra Comment"] = additionalComment.isEmpty ? "Not provided" : additionalComment;

    // Check if at least one field is filled
    final hasInput = activityData.values.any((value) => value != "Not provided");
    if (!hasInput) {
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

    try {
      await saveActivityOnFirebase(
        activityName: 'Activity4',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "প্রতিদিন নিজের সাথে পজিটিভ বা ইতিবাচক কথা বলার অভ্যাস গড়ে তুলি এবং লেখি।",
              style: TextStyle(fontSize: 16),
            ),
            const Text(
                  "এই অভ্যাসটি চর্চার ফলে আপনার আত্মবিশ্বাস বাড়ার সাথে সাথে কর্মক্ষমতা বৃদ্ধি পাবে, হতাশা দূর হবে এবং ইতিবাচক মনোভাব তৈরি হবে।",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            _buildTable(),
            const SizedBox(height: 20),
            const Text(
              "আরও বেশি বেশি নিজের সাথে পজিটিভ বা ইতিবাচক কথা বলার অভ্যাস চর্চা করি-",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextInputFieldComment(
                commentController, "Add comment", 3, 6),
            const SizedBox(height: 20),
            NormalButton(false, "সাবমিট", onTap: _submit),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTable() {
    return Table(
      border: TableBorder.all(color: Colors.grey.shade400),
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
      },
      children: [
        const TableRow(
          decoration: BoxDecoration(color: Color(0xFFE0E0E0)),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("নেগেটিভ বা নেতিবাচক বাক্য",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("পজিটিভ বা ইতিবাচক বাক্য",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        for (int i = 0; i < 2; i++)
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                // controller: negativeControllers[i],
                controller: TextEditingController(text: negativeStatements[i]),
                style: const TextStyle(
                    color: Colors.black
                ),
                enabled: false,
                decoration: InputDecoration(
                  hintText: "নেগেটিভ চিন্তা",
                  contentPadding: const EdgeInsets.all(8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(width: 2, color: ColorUtil.bgGreyDarkReal),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(width: 2, color: ColorUtil.bgGreyDarkReal),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(width: 1, color: ColorUtil.button),
                  ),
                ),
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                // controller: negativeControllers[i],
                controller: TextEditingController(text: positiveStatements[i]),
                style: const TextStyle(
                    color: Colors.black
                ),
                enabled: false,
                decoration: InputDecoration(
                  hintText: "ইতিবাচক চিন্তা",
                  contentPadding: const EdgeInsets.all(8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(width: 2, color: ColorUtil.bgGreyDarkReal),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(width: 2, color: ColorUtil.bgGreyDarkReal),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(width: 1, color: ColorUtil.button),
                  ),
                ),
                maxLines: 3,
              ),
            ),
          ],),
        for (int i = 2; i < 6; i++)
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              // controller: negativeControllers[i],
              controller: TextEditingController(text: negativeStatements[i]),
              enabled: false,
              style: const TextStyle(
                  color: Colors.black
              ),
              decoration: InputDecoration(
                hintText: "নেগেটিভ চিন্তা",
                hintStyle: const TextStyle(
                  color: Colors.grey
                ),
                contentPadding: const EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(width: 2, color: ColorUtil.bgGreyDarkReal),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(width: 2, color: ColorUtil.bgGreyDarkReal),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(width: 1, color: ColorUtil.button),
                ),
              ),
              maxLines: 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: positiveControllers[i],
              style: const TextStyle(
                color: Colors.black
              ),
              decoration: InputDecoration(
                // hintText: "ইতিবাচক কথা",
                hintStyle: const TextStyle(
                    color: Colors.grey
                ),
                contentPadding: const EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(width: 1, color: ColorUtil.bgGreyDarkReal),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(width: 1, color: ColorUtil.bgGreyDarkReal),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(width: 1, color: ColorUtil.button),
                ),
              ),
              maxLines: 3,
            ),
          ),
        ], ),
      ],
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: const Text(
        "নিজের সাথে পজিটিভ বা ইতিবাচক কথা বলার অভ্যাস করি",
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
