import 'package:flutter/material.dart';
import '../../../Common/after_activity_dialogue.dart';
import '../../../firebase_call/save_activity.dart';
import '../../../route/navigation_service.dart';
import '../../../util/color_util.dart';
import '../../../Common/normal_button.dart';

class Activity12 extends StatefulWidget {
  const Activity12({super.key});

  @override
  State<Activity12> createState() => _Activity12State();
}

class _Activity12State extends State<Activity12> {
  final List<String> days = [
    "শনিবার",
    "রবিবার",
    "সোমবার",
    "মঙ্গলবার",
    "বুধবার",
    "বৃহস্পতিবার",
    "শুক্রবার",
  ];

  final List<String> actions = [
    "আমি নিজেকে ক্ষমা করেছি",
    "মানুষকে ক্ষমা করেছি",
    "সৃষ্টিকর্তার কাছে ক্ষমা চেয়েছি",
  ];

  late Map<String, Map<String, bool>> tableData;

  @override
  void initState() {
    super.initState();
    tableData = {
      for (var day in days) day: {for (var action in actions) action: false}
    };
  }

  String getTodayInBangla() {
    final weekday = DateTime.now().weekday;
    const banglaDays = [
      "রবিবার",
      "সোমবার",
      "মঙ্গলবার",
      "বুধবার",
      "বৃহস্পতি",
      "শুক্রবার",
      "শনিবার",
    ];
    return banglaDays[weekday % 7];
  }

  Widget buildCell(String day, String action) {
    final checked = tableData[day]?[action] ?? false;
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
          tableData[day]![action] = !checked;
        });
      },
      child: Icon(
        checked ? Icons.check_circle : Icons.radio_button_unchecked,
        color: checked ? Colors.green : Colors.grey,
      ),
    );
  }

  TableRow buildTableRow(String day) {
    return TableRow(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.black),
              bottom: BorderSide(color: Colors.black),
              right: BorderSide(color: Colors.black),
              left: BorderSide(color: Colors.black),
            ),
          ),
          alignment: Alignment.center,
          height: 120,
          child: Text(day, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.black),
              bottom: BorderSide(color: Colors.black),
              right: BorderSide(color: Colors.black),
              left: BorderSide(color: Colors.black),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: actions.map((action) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: [
                  buildCell(day, action),
                  const SizedBox(width: 8),
                  Expanded(child: Text(action)),
                ],
              ),
            )).toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "ক্ষমা একটি মহৎ গুণ। তাই প্রতিদিন ঘুমানোর আগে সবাইকে ক্ষমা করে দেই। সৃষ্টিকর্তার কাছে ক্ষমা চাই। ক্ষমা করা মানে অন্যায়কে মেনে নেওয়া নয়, বরং নিজেকে ভারমুক্ত করা। প্রতিদিন ক্ষমা করে দেওয়ার অভ্যাস চর্চার মাধ্যমে নিজের মনকে শান্ত ও হালকা করা যায়।",
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              "রাতে ঘুমাতে যাওয়ার আগে বা অন্য যে কোন সময় ক্ষমা করে দেওয়ার অভ্যাস চর্চা করি এবং নিচের ঘরগুলোতে টিক চিহ্ন দেইঃ ",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Table(
              border: TableBorder.all(color: Colors.black),
              columnWidths: const {
                0: FixedColumnWidth(100),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                const TableRow(
                  decoration: BoxDecoration(color: Colors.grey),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("দিন", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("ক্ষমা করেছি কি?", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    ),
                  ],
                ),
                ...days.map(buildTableRow).toList(),
              ],
            ),
            const SizedBox(height: 20),
            NormalButton(false, "সাবমিট", onTap: saveData),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
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

    final activityData = todayData.map((key, value) => MapEntry(key, value ? "করেছে" : "করেনি"));

    try {
      await saveActivityOnFirebase(
        activityName: "Activity12",
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


  _appbar() {
    return AppBar(
      title: const Text(
        "ক্ষমা করার অভ্যাস চর্চা করি",
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
