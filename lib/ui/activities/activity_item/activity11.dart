import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Common/after_activity_dialogue.dart';
import '../../../Common/normal_button.dart';
import '../../../firebase_call/save_activity.dart';
import '../../../route/navigation_service.dart';
import '../../../util/color_util.dart';


class Activity11 extends StatefulWidget {

  const Activity11({super.key});
  @override
  State<Activity11> createState() => _Activity11State();
}

class _Activity11State extends State<Activity11> {
  @override
  void initState() {
    super.initState();
    tableData = {
      for (var day in days)
        day: {for (var header in headers) header: false}
    };
    loadData();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  final List<String> days = [
    "শনিবার",
    "রবিবার",
    "সোমবার",
    "মঙ্গলবার",
    "বুধবার",
    "বৃহস্পতি",
    "শুক্রবার",
  ];

  final List<String> headers = [
    "মনোযোগ দিয়ে ও আগ্রহ নিয়ে অন্যের কথা শুনছি তো?",
    "অপরের দৃষ্টিভঙ্গিকে সন্মান ও গুরুত্ব দিচ্ছি তো?",
    "আমার কোন কথায় বা কাজে কেউ যেন কষ্ট বা আঘাত না পায় সেই দিকে খেয়াল রাখছি তো?  ",
    "নিয়মিতভাবে কৃতজ্ঞতা প্রকাশ করছি তো?",
    "অন্যদের ক্ষমা করছি তো?",
  ];

  late Map<String, Map<String, bool>> tableData;

  Future<void> loadData() async {
    // Example Firestore fetch logic; replace with your actual path
    final doc = await FirebaseFirestore.instance.collection('activity11').doc('user123').get();
    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;
      setState(() {
        tableData = data.map((day, entries) => MapEntry(
            day,
            Map<String, bool>.from(entries as Map)
        ));
      });
    }
  }

  Future<void> saveData() async {
    final today = getTodayInBangla();

    final todayData = tableData[today];

    if (todayData == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("আজকের দিনের তথ্য পাওয়া যায়নি।")),
      );
      return;
    }

    final formattedDate = DateTime.now().toIso8601String().split("T")[0]; // e.g. 2025-06-23

    // Convert boolean to Bangla string
    final activityData = todayData.map((key, value) =>
        MapEntry(key, value ? "করেছে" : "করেনি"));

    try {
      await saveActivityOnFirebase(
        activityName: 'Activity11',
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

  Widget buildCell(String day, String header) {
    final checked = tableData[day]?[header] ?? false;
    final today = getTodayInBangla();

    return GestureDetector(
      onTap: () {
        if (day != today) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("সতর্কতা"),
              content: const Text("শুধুমাত্র আজকের দিনের ঘরে টিক দিন।"),
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

        setState(() {
          tableData[day]![header] = !checked;
        });
      },
      child: Container(
        width: 120,
        height: 60,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        child: Icon(
          checked ? Icons.check_circle : Icons.radio_button_unchecked,
          color: checked ? Colors.green : Colors.grey,
        ),
      ),
    );
  }

  Widget buildHeaderCell(String text) {
    return Container(
      width: 120,
      height: 200,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        border: Border.all(color: Colors.grey),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 12),
              const Text(
                "পরস্পরের সাথে ভাল সম্পর্ক রাখলে পারিবারিক ও সামাজিক সম্পর্কগুলোর উন্নয়ন হয় এবং পারস্পরিক বোঝাপড়া বৃদ্ধি পায় ফলে পারস্পরিক যে কোনো বিরোধ নিরসন হয়। "
                    "সামাজিক যোগাযোগ বৃদ্ধি করতে এবং সামাজিক বন্ধন সুন্দর করতে নিচের কাজগুলো করি এবং খালি ঘরগুলোতে টিক চিহ্ন দেই।  ",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 80,
                          height: 200,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            border: Border.all(color: Colors.grey),
                          ),
                          child: const Text("দিন", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        ...headers.map((h) => buildHeaderCell(h)).toList(),
                      ],
                    ),
                    ...days.map((day) => Row(
                      children: [
                        Container(
                          width: 80,
                          height: 60,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Text(day, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        ...headers.map((header) => buildCell(day, header)).toList(),
                      ],
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              NormalButton(false, "সাবমিট", onTap: saveData),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  String getTodayInBangla() {
    final weekday = DateTime.now().weekday; // 1 = Monday, 7 = Sunday
    const banglaDays = [
      "রবিবার",
      "সোমবার",
      "মঙ্গলবার",
      "বুধবার",
      "বৃহস্পতি",
      "শুক্রবার",
      "শনিবার",
    ];
    return banglaDays[weekday % 7]; // ensures Sunday is last
  }

  _appbar() {
    return AppBar(
      title: const Text(
        // getTranslated(context, "LEAVE_APPLY"),
        "সামাজিক যোগাযোগ বাড়াই ও সামাজিক বন্ধন সুন্দর করি",
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

