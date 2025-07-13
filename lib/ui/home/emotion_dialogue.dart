import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmotionDialog extends StatefulWidget {
  const EmotionDialog({super.key});

  @override
  State<EmotionDialog> createState() => _EmotionDialogState();
}

class _EmotionDialogState extends State<EmotionDialog> {
  String? selectedEmotion;


  final List<Map<String, String>> emotions = [
    {"emoji": "assets/images/emg_anxious.png", "label": "দুশ্চিন্তা"},
    {"emoji": "assets/images/emg_shock.png", "label": "ভয়"},
    {"emoji": "assets/images/emg_angry.png", "label": "রাগ"},
    {"emoji": "assets/images/emg_sad.png", "label": "দুঃখ"},
    {"emoji": "assets/images/emg_neutral.png", "label": "বিরক্তি"},
    {"emoji": "assets/images/emg_happy.png", "label": "আনন্দ"},
  ];

  void _submit() async {
    if (selectedEmotion == null) return;

    // await FirebaseFirestore.instance.collection("feelings").add({
    //   "emotion": selectedEmotion,
    //   "timestamp": Timestamp.now(),
    // });

    Navigator.of(context).pop(true); // allow exit
    SystemNavigator.pop(); // exit app
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("আপনি এখন কেমন অনুভব করছেন।"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...emotions.map((e) {
              final isSelected = selectedEmotion == e['label'];
              return ListTile(
                // leading: Text(e['emoji']!, style: const TextStyle(fontSize: 28)),
                leading: Image.asset(e['emoji']!, height: 30, width: 30),
                title: Text(e['label']!, style: const TextStyle(fontSize: 18)),
                trailing: isSelected
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : null,
                onTap: () {
                  setState(() {
                    selectedEmotion = e['label'];
                  });
                },
              );
            }),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: selectedEmotion != null ? _submit : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Change this to any color you want
              ),
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
