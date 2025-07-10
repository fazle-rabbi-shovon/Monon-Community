import 'package:flutter/material.dart';
import 'package:monon/ui/bayam/bayam_player.dart';
import 'package:monon/util/color_util.dart';
import 'package:monon/util/image_util.dart';

import '../../route/navigation_service.dart';

class BayamMainPage extends StatelessWidget {
  final List<String> titles = [
    "দুশ্চিন্তা, ভয়, রাগ, দুঃখ দূর করা ও আত্মবিশ্বাস বাড়ানোর অনুশীলন",
    "নমানসিক চাপ, নেতিবাচক চিন্তা নিয়ন্ত্রণ এবং মন শান্ত রাখার অনুশীলন",
    "প্রতিদিনের সহজ ব্যায়ামসমূহ",
  ];

  final List<String> videoUrls = [
    "https://f003.backblazeb2.com/file/monon-audio/bayam/Finger+Hold.mp4",
    "https://f003.backblazeb2.com/file/monon-audio/bayam/tapping+and+stress+ball.mp4",
    "https://f003.backblazeb2.com/file/monon-audio/bayam/Daily+Exercise.mp4"
  ];

  final List<Color> cardColors = [
    Colors.white, // Light Blue
    ColorUtil.writtenDoc, // Light Yellow
  ];

  BayamMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appbar(),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Card(
            color: cardColors[index % 2],
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              contentPadding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
              trailing: const Icon(Icons.play_circle_filled, color: Colors.grey),
              title: Text(
                titles[index],
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BayamPlayer(
                      title: titles[index],
                      url: videoUrls[index],
                      index: index,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: const Text("ব্যায়াম বা শরীরচর্চা করি", style: TextStyle(color: Colors.white, fontSize: 18)),
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
}