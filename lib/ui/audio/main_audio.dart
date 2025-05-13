import 'package:flutter/material.dart';

import '../../route/navigation_service.dart';
import '../../util/color_util.dart';
import '../../util/image_util.dart';
import 'audio_sub.dart';

class MainAudio extends StatefulWidget {
  const MainAudio({super.key});

  @override
  State<MainAudio> createState() => _MainAudioState();
}

class _MainAudioState extends State<MainAudio> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _buildAudioFolder(context, "Audio1", 1),
            _buildAudioFolder(context, "Audio2", 2),
          ],
        ),
      ),
    );
  }

  Widget _buildAudioFolder(
      BuildContext context, String title, int folderNumber) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) =>
                    AudioSub(pageNumber: folderNumber)));
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                ImageUtil.AUDIO_IMAGE,), // Replace with your image asset
            ),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
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
          onPressed: () {
            NavigationService.getCurrentState()?.pop();
          },
        ),
      ],
      leading: Container(
        child: const Center(),
      ),
      title: const Text(
        // getTranslated(context, "LEAVE_APPLY"),
        "Audio",
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
