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
      body: Container(
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
            Expanded(
              flex: 1,
              child: buildOptionCard(
                context,
                "VIDEO",
                Icons.play_circle_fill,
                ColorUtil.primary.shade700,
                ColorUtil.primary.shade300,
                videoPush,
                // VideoPage(),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              flex: 1,
              child: buildOptionCard(
                context,
                "AUDIO",
                Icons.music_note,
                // ColorUtil.primaryDark.shade700,
                // ColorUtil.primaryDark.shade300,
                Colors.grey.shade300,
                Colors.grey.shade200,
                audioPush,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              flex: 1,
              child: buildOptionCard(
                context,
                "WRITTEN DOCUMENTS",
                Icons.description,
                ColorUtil.primary.shade700,
                ColorUtil.primary.shade300,
                documentPush,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              flex: 1,
              child: buildOptionCard(
                context,
                "ACTIVITIES",
                Icons.directions_run,
                Colors.grey.shade300,
                Colors.grey.shade200,
                activityPush,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              flex: 1,
              child: buildOptionCard(
                context,
                "TASK\nComplete all and open it",
                Icons.lock,
                ColorUtil.primary.shade700,
                ColorUtil.primary.shade300,
                finalTaskPush,
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  void audioPush() {
    NavigationService.getCurrentState()
        ?.pushNamed('/main_audio');
  }

  // void videoPush() {
  //   NavigationService.getCurrentState()
  //       ?.pushNamed('/video');
  // }

  void videoPush() {
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
  void documentPush() {
    NavigationService.getCurrentState()
        ?.pushNamed('/video');
  }

  void activityPush() {
    NavigationService.getCurrentState()
        ?.pushNamed('/activities_main');
  }

  void finalTaskPush() {
    NavigationService.getCurrentState()
        ?.pushNamed('/video');
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
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),
            trailing: Icon(
              icon,
              color: Colors.white,
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
        "Folder",
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

