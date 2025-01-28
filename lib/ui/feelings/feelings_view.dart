import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../route/navigation_service.dart';
import '../../util/color_util.dart';

class FeelingsView extends StatefulWidget {

  const FeelingsView({super.key});
  @override
  State<FeelingsView> createState() => _FeelingsViewState();
}

class _FeelingsViewState extends State<FeelingsView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  String currentFeeling = 'assets/images/emg_sad.png'; // Default top emoji image path
  String selectedFeeling = ''; // Tracks which emoji is selected for animation

  final Map<String, String> feelings = {
    'Happy': 'assets/images/emg_happy.png',
    'Sad': 'assets/images/emg_sad.png',
    'Neutral': 'assets/images/emg_neutral.png',
    'Angry': 'assets/images/emg_angry.png',
    'Surprised': 'assets/images/emg_shock.png',
    'Anxious': 'assets/images/emg_anxious.png',
  };

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'How do you Feel Now?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.asset(
              currentFeeling,
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: feelings.keys.length,
                itemBuilder: (context, index) {
                  String feeling = feelings.keys.elementAt(index);
                  String imagePath = feelings[feeling]!;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentFeeling = imagePath;
                        selectedFeeling = feeling;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      height: selectedFeeling == feeling ? 70 : 60,
                      width: selectedFeeling == feeling ? 70 : 60,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            imagePath,
                            height: selectedFeeling == feeling ? 70 : 60,
                            width: selectedFeeling == feeling ? 70 : 60,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            feeling,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle submit button action
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blueAccent,
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _appbar(){
    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.transparent,
          ),
          onPressed: () {},
        ),
      ],
      leading: Container(
        child: const Center(
        ),
      ),
      title: Text(
        // getTranslated(context, "LEAVE_APPLY"),
        "Feelings",
        style: TextStyle(
          color: ColorUtil.primary,
          fontSize: 18.0,
        ),
      ),
      backgroundColor: ColorUtil.bgGrey,
      iconTheme: IconThemeData(color: ColorUtil.primary),
      elevation: 0,
      centerTitle: true,
    );
  }
}

