import 'package:flutter/material.dart';
import 'package:monon/Common/normail_button.dart';
import '../../../Common/text_input_field.dart';
import '../../../util/color_util.dart';

class Activity4 extends StatefulWidget {
  const Activity4({super.key});

  @override
  State<Activity4> createState() => _Activity4State();
}

class _Activity4State extends State<Activity4> {

  final List<String> negativeStatements = [
    "আমি তো কিছুই ঠিকমতো পারি না",
    "আমি খুবই দুর্বল",
    "আমার কারণে পরিবারের অনেক ক্ষতি হয়েছে",
    "আমার দ্বারা কিছু হবে না",
    "আমি কোনো কিছুতেই সফল হতে পারি না",
    "আমার তুলনায় অন্যরা অনেক ভালো",
  ];

  final List<String> positiveStatements = [
    "আমি চেষ্টা চালিয়ে যাচ্ছি",
    "আমি ধীরে ধীরে পরিবর্তনের চেষ্টা করছি",
  ];
  // Controllers for each row's input
  final List<TextEditingController> negativeControllers =
  List.generate(6, (_) => TextEditingController());
  final List<TextEditingController> positiveControllers =
  List.generate(6, (_) => TextEditingController());

  final TextEditingController commentController = TextEditingController();

  void _submit() {
    for (int i = 0; i < 6; i++) {
      debugPrint(
          'Row ${i + 1}: Negative: ${negativeControllers[i].text} | Positive: ${positiveControllers[i].text}');
    }
    debugPrint('Additional Comment: ${commentController.text}');

    // Add Firestore or DB saving logic here

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Your responses have been saved.")),
    );
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
            const Text(
              "Activity- 4: নিজের সাথে পজিটিভ বা ইতিবাচক কথা বলার অভ্যাস করি",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "প্রতিদিন নিজের সাথে পজিটিভ বা ইতিবাচক কথা বলার অভ্যাস জীবনকে দৃঢ় এবং স্থির করে। "
                  "এই অভ্যাসটি আমাদের আত্মবিশ্বাস বাড়াতে এবং কর্মক্ষমতা বৃদ্ধি করতে, হতাশা দূর করতে এবং ইতিবাচক মনোভাব গড়ে তুলতে সাহায্য করে।",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            _buildTable(),
            const SizedBox(height: 20),
            const Text(
              "আরও বেশি নিজের সাথে পজিটিভ বা ইতিবাচক কথা বলার অভ্যাস গড়ে তুলি।",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextInputFieldComment(
                commentController, "Add comment", 3, 6),
            const SizedBox(height: 20),
            NormalButton(false, "Submit", onTap: _submit),
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
              child: Text("নেগেটিভ বা নেতিবাচক কথা",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("পজিটিভ বা ইতিবাচক কথা",
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
                hintText: "ইতিবাচক কথা",
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
        "Activity 4",
        style: TextStyle(color: Colors.white, fontSize: 18.0),
      ),
      backgroundColor: ColorUtil.primary,
      iconTheme: const IconThemeData(color: Colors.white),
      elevation: 0,
      centerTitle: true,
    );
  }
}
