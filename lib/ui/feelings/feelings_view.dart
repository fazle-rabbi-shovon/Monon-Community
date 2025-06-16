import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monon/Common/login_gradient_button_decoration.dart';
import 'package:monon/Common/normal_gradient_button_decoration.dart';

import '../../route/navigation_service.dart';
import '../../util/color_util.dart';
import '../../util/dimen_values_util.dart';

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

  String currentFeeling =
      'assets/images/emg_sad.png'; // Default top emoji image path
  String selectedFeeling = ''; // Tracks which emoji is selected for animation

  final Map<String, String> feelings = {
    // 'Happy': 'assets/images/emg_happy.png',
    // 'Sad': 'assets/images/emg_sad.png',
    // 'Neutral': 'assets/images/emg_neutral.png',
    // 'Angry': 'assets/images/emg_angry.png',
    // 'Surprised': 'assets/images/emg_shock.png',
    // 'Anxious': 'assets/images/emg_anxious.png',

    'দুশ্চিন্তা': 'assets/images/emg_anxious.png',
    'ভয়': 'assets/images/emg_shock.png',
    'রাগ': 'assets/images/emg_angry.png',
    'দুঃখ': 'assets/images/emg_sad.png',
    'বিরক্তি': 'assets/images/emg_neutral.png',
    'আনন্দ ': 'assets/images/emg_happy.png',
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'আপনার অনুভূতি',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'এই মুহূর্তে আপনার মনের অবস্থা প্রকাশ করুন। এখন আপনি কেমন অনুভব করছেন?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
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
              applyButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget applyButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 20.0),
      height: DimenValuesUtil.buttonHeight,
      decoration: GradientButtonDecoration(),
      child: InkWell(
        onTap: () {
          NavigationService.getCurrentState()
              ?.pushReplacementNamed('/home', arguments: 0);
        },
        child: const Center(
          child: Text(
            "সাবমিট",
            style: TextStyle(
              color: Colors.white,
              fontSize: DimenValuesUtil.title,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  _appbar() {
    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
      leading: Container(
        child: const Center(),
      ),
      title: const Text(
        // getTranslated(context, "LEAVE_APPLY"),
        "Emotions",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
      backgroundColor: ColorUtil.primary,
      iconTheme: const IconThemeData(color: Colors.white),
      elevation: 0,
      centerTitle: true,
    );
  }
}
