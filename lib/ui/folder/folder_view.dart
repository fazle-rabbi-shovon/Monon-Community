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
                Colors.yellow.shade700,
                Colors.yellow.shade300,
                // AudioPage(),
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
                // DocumentsPage(),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              flex: 1,
              child: buildOptionCard(
                context,
                "ACTIVITIES",
                Icons.directions_run,
                Colors.yellow.shade700,
                Colors.yellow.shade300,
                // ActivitiesPage(),
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
                // TaskPage(),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget buildOptionCard(
      BuildContext context,
      String title,
      IconData icon,
      Color startColor,
      Color endColor,
      // Widget nextPage,
      ) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => nextPage),
        // );
      },
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

