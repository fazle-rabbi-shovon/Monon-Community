import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monon/Common/normal_gradient_button_decoration.dart';
import 'package:monon/ui/feelings/user_emotion_enum.dart';
import '../../Common/login_gradient_button_decoration.dart';
import '../../route/navigation_service.dart';
import '../../util/color_util.dart';
import '../../util/dimen_values_util.dart';
import 'emotion_storage.dart';

class FeelingsView extends StatefulWidget {
  const FeelingsView({super.key});

  @override
  State<FeelingsView> createState() => _FeelingsViewState();
}

class _FeelingsViewState extends State<FeelingsView> with TickerProviderStateMixin {
  // String selectedFeeling = '';
  // final Map<String, String> feelings = {
  //   'দুশ্চিন্তা': 'assets/images/emg_anxious.png',
  //   'ভয়': 'assets/images/emg_shock.png',
  //   'রাগ': 'assets/images/emg_angry.png',
  //   'দুঃখ': 'assets/images/emg_sad.png',
  //   'বিরক্তি': 'assets/images/emg_neutral.png',
  //   'আনন্দ ': 'assets/images/emg_happy.png',
  // };

  UserEmotion? selectedEmotion;
  final Map<UserEmotion, String> feelings = {
    UserEmotion.anxious: 'assets/images/emg_anxious.png',
    UserEmotion.scared: 'assets/images/emg_shock.png',
    UserEmotion.angry: 'assets/images/emg_angry.png',
    UserEmotion.sad: 'assets/images/emg_sad.png',
    UserEmotion.annoyed: 'assets/images/emg_neutral.png',
    UserEmotion.happy: 'assets/images/emg_happy.png',
  };

  late Map<UserEmotion, AnimationController> _controllers;
  late Map<UserEmotion, Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    _controllers = {};
    _animations = {};

    for (var feeling in feelings.keys) {
      final controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1400),
      );

      final animation = TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.6), weight: 50),
        TweenSequenceItem(tween: Tween(begin: 1.6, end: 1.0), weight: 30),
        // TweenSequenceItem(tween: Tween(begin: 0.8, end: 1.0), weight: 20),
      ]).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

      _controllers[feeling] = controller;
      _animations[feeling] = animation;
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  // void _onFeelingTap(String feeling) {
  //   if (selectedFeeling.isNotEmpty) {
  //     _controllers[selectedFeeling]?.stop();
  //   }
  //   setState(() => selectedFeeling = feeling);
  //   _controllers[feeling]?.repeat(reverse: true);
  // }

  void _onFeelingTap(UserEmotion emotion) {
    if (selectedEmotion != null) {
      _controllers[selectedEmotion!]?.stop();
    }
    setState(() => selectedEmotion = emotion);
    _controllers[emotion]?.repeat(reverse: true);
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
              const Text('আপনার অনুভূতি',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text(
                'এই মুহূর্তে আপনার মনের অবস্থা প্রকাশ করুন। এখন আপনি কেমন অনুভব করছেন?',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              Expanded(
                child: GridView.builder(
                  itemCount: feelings.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    // final feeling = feelings.keys.elementAt(index);
                    // final imagePath = feelings[feeling]!;

                    final emotion = feelings.keys.elementAt(index);
                    final imagePath = feelings[emotion]!;

                    return GestureDetector(
                      onTap: () => _onFeelingTap(emotion),
                      child: AnimatedBuilder(
                        animation: _animations[emotion]!,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: selectedEmotion == emotion
                                ? _animations[emotion]?.value ?? 1.0
                                : 1.0,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(imagePath, height: 60, width: 60),
                                const SizedBox(height: 5),
                                Text(emotion.label, style: const TextStyle(fontSize: 16)),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              // const SizedBox(height: 20),
              applyButton(),
              const SizedBox(height: 20),
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
        onTap: () async {
          // if (selectedFeeling.isEmpty) return;
          if (selectedEmotion == null) return;
          await EmotionStorage.saveEmotion(selectedEmotion!);

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              backgroundColor: Colors.white,
              title: const Text(
                "ধন্যবাদ",
                style: TextStyle(color: ColorUtil.mainColor, fontWeight: FontWeight.bold),
              ),
              content: const Text(
                "আপনার অনুভূতি প্রকাশ করার জন্য ধন্যবাদ",
                style: TextStyle(color: Colors.black87),
              ),
            ),
          );
          Future.delayed(const Duration(milliseconds: 1000), () {
            Navigator.of(context, rootNavigator: true).pop();
            NavigationService.getCurrentState()
                ?.pushReplacementNamed('/home', arguments: 0);
          });

        },
        child: const Center(
          child: Text("সাবমিট",
              style: TextStyle(
                color: Colors.white,
                fontSize: DimenValuesUtil.title,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}


