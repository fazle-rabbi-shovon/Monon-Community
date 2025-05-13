import 'package:flutter/material.dart';
import 'package:monon/Common/normail_button.dart';
import '../../../Common/text_input_field.dart';
import '../../../util/color_util.dart';
import '../../../util/image_util.dart';

class Activity5 extends StatefulWidget {
  const Activity5({super.key});

  @override
  State<Activity5> createState() => _Activity5State();
}

class _Activity5State extends State<Activity5> {
  final TextEditingController relationshipController = TextEditingController();

  void _submitComment() {
    final relationData = relationshipController.text.trim();
    debugPrint('Relationship Reflection: $relationData');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Your response has been saved.')),
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
              "Activity- 5: কাছের মানুষের প্রতি সচেতনতা বাড়াই ও সংযুক্ত হই",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              "এটি একটি সম্পর্কের গাছ এর ছবি। এমন মানুষদের কথা চিন্তা করুন ও লিখুন যাদের আপনি নিজের কাছের মানুষ মনে করেন এবং যারা "
                  "সব সময় আপনার পাশে থাকেন। এটি যে কোন সম্পর্ক হতে পারে। এক্ষেত্রে মানুষের নাম বা সম্পর্কের নাম, যে কোন একটি উল্লেখ "
                  "করতে পারবেন। যদি আপনি মানুষটির নাম বা সম্পর্কের নাম কোনটি উল্লেখ করতে না চান "
                  "তাহলে শুধু সংখ্যার মাধ্যমে এমন কতজন কাছের মানুষ আছেন তার মোট "
                  "সংখ্যা উল্লেখ করুন। এই অনুশীলনটি একটি সুন্দর পারষ্পরিক সম্পর্ক বজায় রাখার দক্ষতা বাড়াতে আপনাকে সাহায্য করবে।   ",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            const Text(
              "সম্পর্কের গাছ (Relationship Tree):",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Center(
              child: Image.asset(
                ImageUtil.RELATIONSHIP_TREE,
                key: const Key('logo-image'),
                width: 250,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "আপনার সম্পর্কের গাছ সম্পর্কে লিখুন:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextInputFieldComment(
              relationshipController,
              "Add your comment about your close connections...",
              4,
              10,
            ),
            const SizedBox(height: 20),
            NormalButton(false, "Submit", onTap: _submitComment),
          ],
        ),
      ),
    );
  }

  _appbar() {
    return AppBar(
      title: const Text(
        "Activity 5",
        style: TextStyle(color: Colors.white, fontSize: 18.0),
      ),
      backgroundColor: ColorUtil.primary,
      iconTheme: const IconThemeData(color: Colors.white),
      elevation: 0,
      centerTitle: true,
    );
  }
}
