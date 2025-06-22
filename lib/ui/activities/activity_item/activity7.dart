import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:monon/Common/normal_button.dart';
import '../../../route/navigation_service.dart';
import '../../../util/color_util.dart';

class Activity7 extends StatefulWidget {
  const Activity7({super.key});

  @override
  State<Activity7> createState() => _Activity7State();
}

class _Activity7State extends State<Activity7> {
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
    "পর্যাপ্ত ঘুমিয়েছি অর্থাৎ সকালে সতেজ ও প্রাণবন্ত ভাবে ঘুম  থেকে উঠেছি",
    "সুষম খাবার যেমন শাক-সবজি, ফলমূল পর্যাপ্ত পরিমাণে খেয়েছি",
    "কমপক্ষে পনের মিনিট সময় নিজের পছন্দমত করে কাটিয়েছি",
    "বিভিন্ন শরীরচর্চা  যেমন হাঁটা বা ব্যায়াম করেছি",
    "পরিপূর্ণ মনোযোগ দিয়ে ধর্মীয় প্রার্থনা করেছি",
    "প্রয়োজনের বেশি মোবাইল ফোন ব্যবহার করিনি",
    "প্রতিটি কাজ পুরোপুরিভাবে শেষ করেছি",
  ];

  late Map<String, Map<String, bool>> tableData;

  @override
  void initState() {
    super.initState();
    tableData = {
      for (var day in days)
        day: {for (var header in headers) header: false}
    };
    loadData();
  }

  Future<void> loadData() async {
    // Example Firestore fetch logic; replace with your actual path
    final doc = await FirebaseFirestore.instance.collection('activity7').doc('user123').get();
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

  // Future<void> saveData() async {
  //   await FirebaseFirestore.instance.collection('activity7').doc('user123').set(tableData);
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(content: Text("Saved successfully!")),
  //   );
  // }

  Future<void> saveData() async {

  }

  Widget buildCell(String day, String header) {
    final checked = tableData[day]?[header] ?? false;
    return GestureDetector(
      onTap: () {
        setState(() {
          tableData[day]![header] = !checked;
        });
      },
      child: Container(
        width: 100,
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
      width: 100,
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
                "নিজেকে শারীরিক ও মানসিকভাবে ভালো রাখার দায়িত্ব নিজেকেই নিতে হবে এবং নিজেকে ভালো রাখতে পারলে অন্যদেরও ভালো রাখা যায়।",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.start,
              ),
              const Text(
                "নিজেকে সময় দিন এবং নিচের ঘরগুলোতে টিক চিহ্ন দিন।",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.start,
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

  _appbar() {
    return AppBar(
      title: const Text(
        "নিজেকে সময় দেই",
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
