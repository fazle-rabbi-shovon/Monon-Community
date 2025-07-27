import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../feelings/emotion_storage.dart';
import '../feelings/user_emotion_enum.dart';
import '../../Common/loading_dialogue.dart';

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

    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => loadingDialogue(),
    );

    await _saveEmotionToFirebase();

    // Wait 60ms for smooth UI transition
    await Future.delayed(const Duration(milliseconds: 60));

    SystemNavigator.pop(); // exit app
  }

  Future<void> _saveEmotionToFirebase() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final now = DateTime.now();
    final formattedDate =
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    final formattedTime =
        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";

    final docRef = FirebaseFirestore.instance
        .collection('emotion')
        .doc(uid)
        .collection(formattedDate)
        .doc(formattedTime);

    // Properly load starting emotion
    final startEmotionEnum = await EmotionStorage.loadEmotion();
    final startLabel = startEmotionEnum?.label;

    await docRef.set({
      "শুরুতে অনুভূতি": startLabel ?? "",
      "শেষে অনুভূতি": selectedEmotion,
      "savedAt": FieldValue.serverTimestamp(),
    });
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

  loadingDialogue(){
    return Dialog(
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: Colors.green),
            SizedBox(height: 16),
            Text(
              'অপেক্ষা করুন...',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
