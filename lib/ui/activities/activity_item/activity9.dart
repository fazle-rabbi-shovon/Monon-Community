import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Common/normal_button.dart';
import '../../../Common/text_input_field.dart';
import '../../../route/navigation_service.dart';
import '../../../util/color_util.dart';


class Activity9 extends StatefulWidget {

  const Activity9({super.key});
  @override
  State<Activity9> createState() => _Activity9State();
}

class _Activity9State extends State<Activity9> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  final List<String> negativeStatements = [
    "তুমি কোনও দিন আমার কথা শোন না।",
    "তুমি ঘরের কোন কাজেই আমাকে সাহায্য করো না। সব কাজ আমাকে একাই করতে হয়।",
    "আমার সবকিছু অসহ্য লাগছে।",
    "তুমি সবসময় আমার সাথে খারাপ ব্যবহার করো।",
  ];

  final List<String> positiveStatements = [
    "আমি গতকাল তোমার সাথে এই বিষয়ে কথা বলেছিলাম, তুমি হয়তো ভুলে গেছ।",
    "একা একা ঘরের সব কাজ করতে আমার বেশ কষ্ট হয়। তুমি কি আজকে আমাকে কাপড়গুলো ধুতে সাহায্য করবে?",
  ];

  final List<TextEditingController> negativeControllers =
  List.generate(4, (_) => TextEditingController());
  final List<TextEditingController> positiveControllers =
  List.generate(4, (_) => TextEditingController());

  final TextEditingController commentControllerOne = TextEditingController();
  final TextEditingController commentControllerTwo = TextEditingController();

  void _submit() {
    for (int i = 0; i < 4; i++) {
      debugPrint(
          'Row ${i + 1}: Negative: ${negativeControllers[i].text} | Positive: ${positiveControllers[i].text}');
    }
    debugPrint('Additional Comment: ${commentControllerOne.text}');
    debugPrint('Additional Comment: ${commentControllerTwo.text}');

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
            const SizedBox(height: 10),
            const Text(
              "যখন কারও সাথে কথা বলি, কথা বলার সময় খেয়াল রাখি, আমার কোন কথায় যেন কেউ কষ্ট না পায়। "
                  "ননভায়োলেন্ট কমিউনিকেশন বা সমানুভূতিশীল যোগাযোগের মাধ্যমে আমরা পরস্পরের সাথে দৃঢ় সম্পর্ক "
                  "গড়ে তুলতে পারি। এটি পারস্পরিক সম্মান, বোঝাপড়া ও সমানুভূতি গড়ে তোলে, যা বিভিন্ন "
                  "ধরনের দ্বন্দ্ব ও মতবিরোধ মীমাংসায় কার্যকর ভূমিকা রাখে।",
              style: TextStyle(fontSize: 16),
            ),
            const Text(
            "নিচের কথাগুলো পড়ুন এবং প্রতিদিন আপনি কিভাবে অপর ব্যক্তির সাথে পজিটিভ বা ইতিবাচক কথা বলার মাধ্যমে একটি চমৎকার যোগাযোগ তৈরি করতে পারেন সেটি প্রাকটিস করুন।",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            _buildTable(),
            const SizedBox(height: 20),
            const Text(
              "আজ আমি অন্য কারও সাথে যেভাবে কথা বলেছি",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextInputFieldComment(
                commentControllerOne, "Add comment", 2, 3),
            const SizedBox(height: 20),
            const Text(
              "আমি যেভাবে ইতিবাচকভাবে কথাটি বলতে পারতাম",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextInputFieldComment(
                commentControllerTwo, "Add comment", 2, 3),
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
              child: Text("আমরা যা বলি",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("আমরা যেভাবে বলতে পারি",
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
        for (int i = 2; i < 4; i++)
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
                  // hintText: "আমরা যেভাবে বলতে পারি",
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

  _appbar() {
    return AppBar(
      title: const Text(
        // getTranslated(context, "LEAVE_APPLY"),
        "ননভায়োলেন্ট কমিউনিকেশন বা সমানুভূতিশীল যোগাযোগ",
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

