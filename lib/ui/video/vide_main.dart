import 'package:flutter/material.dart';
import 'package:monon/ui/video/video_player.dart';

import '../../route/navigation_service.dart';
import '../../util/color_util.dart';
import '../../util/image_util.dart';

// ignore: must_be_immutable
class VideoMain extends StatefulWidget {
  const VideoMain({super.key});

  @override
  State<VideoMain> createState() => VideoMainState();
}

class VideoMainState extends State<VideoMain> {
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
    final List<Map<String, String>> tracks = _getTracks();

    return Scaffold(
      appBar: _appbar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: tracks.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (_, index) {
            final track = tracks[index];
            return _buildAudioTile(track["title"]!,
                track["image"]!, track["url"]!, index);
          },
        ),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: const Text("অনুভূতি ও স্থিতিশীলতা", style: TextStyle(color: Colors.white, fontSize: 18)),
      centerTitle: true,
      backgroundColor: ColorUtil.primary,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          NavigationService.getCurrentState()?.pop();
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            NavigationService.getCurrentState()?.pop();
          },
        ),
      ],
    );
  }

  Widget _buildAudioTile(
      String title, String imagePath, String url, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => VideoPlayerScreen(
              title: title,
              url: url,
              imagePath: imagePath,
              index: index,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  // borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: Image.asset(imagePath,
                      height: 150, width: double.infinity, fit: BoxFit.cover),
                ),
                const Positioned.fill(
                  child: Center(
                    child: Icon(Icons.play_circle_filled,
                        size: 40, color: ColorUtil.mainColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  List<Map<String, String>> _getTracks() {
    return [
      {
        "title": "শ্বাস-প্রশ্বাসের অনুশীলন",
        "image": ImageUtil.MED_BREATHING,
        "url":
            "https://f003.backblazeb2.com/file/monon-audio/video/Breathing+Exercise.mp4"
      },
      {
        "title": "মাইন্ডফুলনেস অনুশীলন",
        "image": ImageUtil.MED_MINDFULNESS,
        "url":
            "https://f003.backblazeb2.com/file/monon-audio/video/Mindfulness+Meditation.mp4"
      },
      {
        "title": "অটোসাজেশন অনুশীলন",
        "image": ImageUtil.MED_AUTOSUGGESTION,
        "url":
            "https://f003.backblazeb2.com/file/monon-audio/video/Autosuggestion+Exercise.mp4"
      },
      {
        "title": "কৃতজ্ঞতা প্রকাশের অনুশীলন",
        "image": ImageUtil.MED_GRATITUDE,
        "url":
            "https://f003.backblazeb2.com/file/monon-audio/video/gratitude.mp4"
      },
      {
        "title": "ক্ষমা করার অনুশীলন",
        "image": ImageUtil.MED_FORGIVENESS,
        "url":
            "https://f003.backblazeb2.com/file/monon-audio/video/forgiveness.mp4"
      },
    ];
  }
}
