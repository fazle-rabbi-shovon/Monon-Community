import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../route/navigation_service.dart';
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
          // decoration: const BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: [Colors.blue, Colors.purple],
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //   ),
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Expanded(
              //   flex: 1,
              //   child: buildOptionCard(
              //     context,
              //     "অনুভূতি ও স্থিতিশীলতা",
              //     Icons.play_circle_fill,
              //     ColorUtil.primary.shade700,
              //     ColorUtil.primary.shade300,
              //     videoPush,
              //     // VideoPage(),
              //   ),
              // ),
              // const SizedBox(height: 16.0),
              Container(
                // flex: 1,
                child: buildOptionCard(
                  context,
                  "বুদ্ধিমত্তা ও আবেগ",
                  Icons.music_note,
                  // ColorUtil.primaryDark.shade700,
                  // ColorUtil.primaryDark.shade300,
                  Colors.grey.shade300,
                  Colors.grey.shade200,
                  audioPush,
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                // flex: 1,
                child: buildOptionCard(
                  context,
                  "কিছু কথা",
                  Icons.description,
                  ColorUtil.primary.shade700,
                  ColorUtil.primary.shade300,
                  documentPush,
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                // flex: 1,
                child: buildOptionCard(
                  context,
                  "আমার কাজ",
                  Icons.directions_run,
                  Colors.grey.shade300,
                  Colors.grey.shade200,
                  activityPush,
                ),
              ),
              const SizedBox(height: 16.0),
              // Expanded(
              //   flex: 1,
              //   child: buildOptionCard(
              //     context,
              //     "নিজ পরিকল্পনা\n(উপরের সবগুলো কাজ সম্পন্ন করুন এবং এটি অনুশীলন করুন)",
              //     Icons.lock,
              //     ColorUtil.primary.shade700,
              //     ColorUtil.primary.shade300,
              //     finalTaskPush,
              //   ),
              // ),
              // const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  void audioPush() {
    NavigationService.getCurrentState()
        ?.pushNamed('/main_audio');
  }

  void videoPush() {
    NavigationService.getCurrentState()
        ?.pushNamed('/video');
  }

  // void videoPush() {
  //   final context = NavigationService.getCurrentContext();
  //   if (context != null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('This feature will be available in the next version of the app.'),
  //         duration: Duration(seconds: 3),
  //       ),
  //     );
  //   }
  // }

  void documentPush() {
    NavigationService.getCurrentState()
        ?.pushNamed('/written_documents');
  }

  void finalTaskPush() {
    final context = NavigationService.getCurrentContext();
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('This feature will be available in the next version of the app.'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  void activityPush() {
    NavigationService.getCurrentState()
        ?.pushNamed('/activities_main');
  }

  Widget buildOptionCard(
      BuildContext context,
      String title,
      IconData icon,
      Color startColor,
      Color endColor,
      VoidCallback nextPage,
      ) {
    return GestureDetector(
      onTap: nextPage,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          gradient: LinearGradient(
            colors: [startColor, endColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
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
            trailing: Icon(
              icon,
              color: Colors.grey,
              size: 30.0,
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

