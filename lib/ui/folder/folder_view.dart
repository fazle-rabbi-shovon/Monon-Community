import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../route/navigation_service.dart';
import '../../services/activity_service.dart';
import '../../util/color_util.dart';

class FolderView extends StatefulWidget {

  const FolderView({super.key});
  @override
  State<FolderView> createState() => _FolderViewState();
}

class _FolderViewState extends State<FolderView>
    with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   child: buildOptionCard(
              //     context,
              //     "অনুভূতি ও স্থিতিশীলতা",
              //     Icons.play_circle_fill,
              //     ColorUtil.primary.shade700,
              //     ColorUtil.primary.shade300,
              //     videoPush,
              //   ),
              // ),
              // const SizedBox(height: 16.0),
              Container(
                child: buildOptionCard(
                  context,
                  "বুদ্ধিমত্তা ও আবেগ",
                  Icons.music_note,
                  // ColorUtil.primaryDark.shade700,
                  // ColorUtil.primaryDark.shade300,
                  Colors.grey.shade300,
                  Colors.grey.shade200,
                  audioPush,
                  progressFuture: ActivityService().getBuddhimottaCompletionPercentage(),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                child: buildOptionCard(
                  context,
                  "কিছু কথা",
                  Icons.description,
                  ColorUtil.primary.shade700,
                  ColorUtil.primary.shade300,
                  documentPush,
                  progressFuture: ActivityService().getTypeCompletionPercentage('kisu_kotha'),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                child: buildOptionCard(
                  context,
                  "আমার কাজ",
                  Icons.directions_run,
                  Colors.grey.shade300,
                  Colors.grey.shade200,
                  activityPush,
                  progressFuture: ActivityService().getTypeCompletionPercentage('amar_kaaj'),
                ),
              ),
              const SizedBox(height: 16.0),
              FutureBuilder<bool>(
                future: ActivityService().isFifthActivityUnlocked(),
                builder: (context, snapshot) {
                  final unlocked = snapshot.data ?? false;
                  return buildOptionCard(
                    context,
                    "নিজ পরিকল্পনা\n(উপরের সবগুলো কাজ সম্পন্ন করুন এবং এটি অনুশীলন করুন)",
                    unlocked ? Icons.check_circle : Icons.lock,
                    ColorUtil.primary.shade700,
                    ColorUtil.primary.shade300,
                    unlocked ? finalTaskPush : () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("অনুগ্রহ করে সবগুলো কাজ শেষ করুন")),
                      );
                    }, // disable tap if not unlocked
                  );
                },
              ),
              const SizedBox(height: 24.0),
              FutureBuilder<double>(
                future: ActivityService().getTotalCompletionPercentage(),
                builder: (context, snapshot) {
                  double progress = snapshot.data ?? 0.0;

                  return Column(
                    children: [
                      Text(
                        'সর্বমোট অগ্রগতি: ${(progress * 100).toStringAsFixed(1)}%',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: progress,
                        minHeight: 10,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                    ],
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  void audioPush() {
    NavigationService.getCurrentState()
        ?.pushNamed('/main_audio').then((_) {
      if (mounted) setState(() {});
    });
  }

  void videoPush() {
    NavigationService.getCurrentState()
        ?.pushNamed('/video').then((_) {
      if (mounted) setState(() {});
    });
  }

  void documentPush() {
    NavigationService.getCurrentState()
        ?.pushNamed('/written_documents').then((_) {
      if (mounted) setState(() {});
    });
  }

  void finalTaskPush() {
    NavigationService.getCurrentState()
        ?.pushNamed('/final_task').then((_) {
      if (mounted) setState(() {});
    });
  }

  void activityPush() {
    NavigationService.getCurrentState()
        ?.pushNamed('/activities_main').then((_) {
      if (mounted) setState(() {});
    });
  }

  Widget buildOptionCard(
      BuildContext context,
      String title,
      IconData icon,
      Color startColor,
      Color endColor,
      VoidCallback nextPage, {
        Future<double>? progressFuture,
      }) {
    return GestureDetector(
      onTap: nextPage,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          gradient: LinearGradient(
            colors: [startColor, endColor],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Center(
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),
            trailing: progressFuture == null
                ? Icon(icon, color: Colors.grey, size: 30)
                : FutureBuilder<double>(
              future: progressFuture,
              builder: (context, snapshot) {
                double value = snapshot.data ?? 0.0;
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        value: value,
                        strokeWidth: 4,
                        // backgroundColor: Colors.grey.shade300,
                        backgroundColor: Colors.white,
                        valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                    ),
                    Text(
                      '${(value * 100).toInt()}%',
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                );
              },
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
            color: Colors.transparent,
          ),
          onPressed: () {},
        ),
      ],
      leading: Container(
        child: const Center(),
      ),
      title: const Text(
        // getTranslated(context, "LEAVE_APPLY"),
        "আবেগ ও অনুভূতি",
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

