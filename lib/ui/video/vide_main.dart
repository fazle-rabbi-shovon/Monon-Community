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
            return _buildAudioTile(track["title"]!, track["duration"]!,
                track["image"]!, track["url"]!);
          },
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
          onPressed: () {
            NavigationService.getCurrentState()?.pop();
          },
        ),
      ],
      leading: Container(
        child: const Center(),
      ),
      title: const Text(
        "Video",
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

  Widget _buildAudioTile(
      String title, String duration, String imagePath, String url) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => VideoPlayerScreen(
              title: title,
              url: url,
              imagePath: imagePath,
              duration: duration,
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
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    color: Colors.black54,
                    child: Text(
                      duration,
                      style: const TextStyle(color: Colors.white),
                    ),
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
          "title": "Mental health",
          "duration": "02:45",
          "image": ImageUtil.VID_MENTAL,
          "url":
          "https://f003.backblazeb2.com/file/monon-audio/video/WD1_FINALUPDATED.mp4"        },
        {
          "title": "Know Yourself",
          "duration": "00:33",
          "image": ImageUtil.VID_KNOW_YOURSELF,
          "url":
          "https://f003.backblazeb2.com/file/monon-audio/video/WD2.mp4"},
        {
          "title": "Empathy",
          "duration": "00:43",
          "image": ImageUtil.VID_EMPATHY,
          "url":
          "https://f003.backblazeb2.com/file/monon-audio/video/WD5.mp4"},
        {
          "title": "Hurt No One",
          "duration": "00:39",
          "image": ImageUtil.VID_HURT_NO_ONE,
          "url":
          "https://f003.backblazeb2.com/file/monon-audio/video/WD7.mp4"},
        {
          "title": "Non Violent Communication",
          "duration": "02:15",
          "image": ImageUtil.VID_NON_VIOLENT_COMMUNICATION,
          "url":
          "https://f003.backblazeb2.com/file/monon-audio/video/WD8.mp4"},
        {
          "title": "How to take care yourself",
          "duration": "02:40",
          "image": ImageUtil.VID_HOW_TAKE_CARE,
          "url":
          "https://f003.backblazeb2.com/file/monon-audio/video/WD12.mp4"},
        {
          "title": "Emotional Bank Account",
          "duration": "02:56",
          "image": ImageUtil.VID_EMOTIONAL_BANK_ACCOUNT,
          "url":
          "https://f003.backblazeb2.com/file/monon-audio/video/WD17+-+Made+with+Clipchamp.mp4"},
      ];
  }
}
