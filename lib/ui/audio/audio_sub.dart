import 'package:flutter/material.dart';

import '../../route/navigation_service.dart';
import '../../util/color_util.dart';
import '../../util/image_util.dart';
import 'audio_player.dart';

// ignore: must_be_immutable
class AudioSub extends StatefulWidget {
  AudioSub({super.key, required this.pageNumber});

  int pageNumber;

  @override
  State<AudioSub> createState() => AudioSubState(pageNumber: pageNumber);
}

class AudioSubState extends State<AudioSub> {
  AudioSubState({required this.pageNumber}) {
    pageNumber = pageNumber;
  }

  int pageNumber;

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
      title: Text(
        // getTranslated(context, "LEAVE_APPLY"),
        (pageNumber == 1) ? "ইমোশনাল ইন্টেলিজেন্স বা আবেগীয় বুদ্ধিমত্তা" : "আবেগের বিভিন্ন রূপ",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
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
      String title, String duration, String imagePath, String url) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AudioPlayerScreen(
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
                    child: Icon(Icons.play_circle_fill,
                        size: 40, color: Colors.white),
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
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }

  List<Map<String, String>> _getTracks() {
    if (pageNumber == 1) {
      return [
        {
          "title": "ইমোশনাল ইন্টেলিজেন্স বা আবেগীয় বুদ্ধিমত্তা সম্পর্কে জানি",
          "duration": "01:24",
          "image": ImageUtil.EMOTIONAL_INTELLIGENCE,
          "url":
              "https://f003.backblazeb2.com/file/monon-audio/Audio1/Folder+1_Audio_1_%E0%A6%87%E0%A6%AE%E0%A7%8B%E0%A6%B6%E0%A6%A8%E0%A6%BE%E0%A6%B2+%E0%A6%87%E0%A6%A8%E0%A7%8D%E0%A6%9F%E0%A7%87%E0%A6%B2%E0%A6%BF%E0%A6%9C%E0%A7%87%E0%A6%A8%E0%A7%8D%E0%A6%B8+%E0%A6%AC%E0%A6%BE+%E0%A6%86%E0%A6%AC%E0%A7%87%E0%A6%97%E0%A7%80%E0%A7%9F+%E0%A6%AC%E0%A7%81%E0%A6%A6%E0%A7%8D%E0%A6%A7%E0%A6%BF%E0%A6%AE%E0%A6%A4%E0%A7%8D%E0%A6%A4%E0%A6%BE.mp3"
        },
        {
          "title": "আত্ম-সচেতনতা",
          "duration": "02:35",
          "image": ImageUtil.SELF_AWARENESS,
          "url":
              "https://f003.backblazeb2.com/file/monon-audio/Audio1/Folder+1_Audio_2_%E0%A6%86%E0%A6%A4%E0%A7%8D%E0%A6%AE%E0%A6%B8%E0%A6%9A%E0%A7%87%E0%A6%A4%E0%A6%A8%E0%A6%A4%E0%A6%BE.mp3"
        },
        {
          "title": "আত্মনিয়ন্ত্রণ",
          "duration": "02:07",
          "image": ImageUtil.SELF_REGULATION,
          "url":
              "https://f003.backblazeb2.com/file/monon-audio/Audio1/Folder+1_Audio_3_%E0%A6%86%E0%A6%A4%E0%A7%8D%E0%A6%A8%E0%A6%A8%E0%A6%BF%E0%A6%AF%E0%A6%BC%E0%A6%A8%E0%A7%8D%E0%A6%A4%E0%A7%8D%E0%A6%B0%E0%A6%A8+(Self+Regulation).mp3"
        },
        {
          "title": "অনুপ্রেরণা",
          "duration": "01:39",
          "image": ImageUtil.MOTIVATION,
          "url":
              "https://f003.backblazeb2.com/file/monon-audio/Audio1/Folder+1_Audio_4_%E0%A6%85%E0%A6%A8%E0%A7%81%E0%A6%AA%E0%A7%8D%E0%A6%B0%E0%A7%87%E0%A6%B0%E0%A6%A3%E0%A6%BE.mp3"
        },
        {
          "title": "সমানুভূতি বা সমমর্মিতা",
          "duration": "03:46",
          "image": ImageUtil.EMPATHY,
          "url":
              "https://f003.backblazeb2.com/file/monon-audio/Audio1/Folder+1_Audio_5_%E0%A6%B8%E0%A6%AE%E0%A6%BE%E0%A6%A8%E0%A7%81%E0%A6%AD%E0%A7%82%E0%A6%A4%E0%A6%BF+%E0%A6%AC%E0%A6%BE+%E0%A6%B8%E0%A6%AE%E0%A6%AE%E0%A6%B0%E0%A7%8D%E0%A6%AE%E0%A6%BF%E0%A6%A4%E0%A6%BE.mp3"
        },
        {
          "title": "সামাজিক দক্ষতা",
          "duration": "02:09",
          "image": ImageUtil.SOCIAL_SKILL,
          "url":
              "https://f003.backblazeb2.com/file/monon-audio/Audio1/Folder+1_Audio_6_%E0%A6%B8%E0%A6%BE%E0%A6%AE%E0%A6%BE%E0%A6%9C%E0%A6%BF%E0%A6%95+%E0%A6%A6%E0%A6%95%E0%A7%8D%E0%A6%B7%E0%A6%A4%E0%A6%BE+(Social+Skills).mp3"
        },
      ];
    } else {
      return [
        {
          "title": "দুশ্চিন্তা",
          "duration": "03:47",
          "image": ImageUtil.ANXIETY,
          "url":
              "https://f003.backblazeb2.com/file/monon-audio/Audio2/Folder+2_Audio_01_%E0%A6%A6%E0%A7%81%E0%A6%83%E0%A6%B6%E0%A7%8D%E0%A6%9A%E0%A6%BF%E0%A6%A8%E0%A7%8D%E0%A6%A4%E0%A6%BE.mp3"
        },
        {
          "title": "ভয়",
          "duration": "03:58",
          "image": ImageUtil.FEAR,
          "url":
              "https://f003.backblazeb2.com/file/monon-audio/Audio2/Folder+2_Audio_02_%E0%A6%AD%E0%A7%9F.mp3"
        },
        {
          "title": "রাগ",
          "duration": "03:46",
          "image": ImageUtil.ANGER,
          "url":
              "https://f003.backblazeb2.com/file/monon-audio/Audio2/Folder+2_Audio_03_%E0%A6%B0%E0%A6%BE%E0%A6%97.mp3"
        },
        {
          "title": "দুঃখ",
          "duration": "03:04",
          "image": ImageUtil.SADNESS,
          "url":
              "https://f003.backblazeb2.com/file/monon-audio/Audio2/Folder+2_Audio_04_%E0%A6%A6%E0%A7%81%E0%A6%83%E0%A6%96.mp3"
        },
        {
          "title": "বিরক্তি",
          "duration": "03:31",
          "image": ImageUtil.DISGUST,
          "url":
              "https://f003.backblazeb2.com/file/monon-audio/Audio2/Folder+2_Audio_05_%E0%A6%AC%E0%A6%BF%E0%A6%B0%E0%A6%95%E0%A7%8D%E0%A6%A4%E0%A6%BF.mp3"
        },
        {
          "title": "আনন্দ",
          "duration": "02:52",
          "image": ImageUtil.HAPPINESS,
          "url":
              "https://f003.backblazeb2.com/file/monon-audio/Audio2/Folder+2_Audio_06_%E0%A6%86%E0%A6%A8%E0%A6%A8%E0%A7%8D%E0%A6%A6.mp3"
        },
      ];
    }
  }
}
