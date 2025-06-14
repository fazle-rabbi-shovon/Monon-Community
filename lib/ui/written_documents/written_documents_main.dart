import 'package:flutter/material.dart';
import 'package:monon/ui/written_documents/written_documents_player.dart';
import 'package:monon/util/color_util.dart';
import 'package:monon/util/image_util.dart';

import '../../route/navigation_service.dart';

class WrittenDocumentsPage extends StatelessWidget {
  final List<String> titles = [
    "মানসিক স্বাস্থ্য সম্পর্কে জানি",
    "নিজের সম্পর্কে জানি",
    "আত্মসচেতনতা বাড়াই",
    "নিজের সাথে পজিটিভ বা ইতিবাচক কথা বলি",
    "সমানুভূতি বা সমমর্মিতা বৃদ্ধি করি",
    "অপরের আবেগ-অনুভূতির দিকে লক্ষ্য রাখি",
    "আমার কথা বা আচরণে কেউ যেন কষ্ট না পায়",
    "ননভায়োলেন্ট কমিউনিকেশন (NVC) বা সমানুভূতিশীল যোগাযোগ",
    "বিভিন্ন মানসিক চাপের লক্ষণসমূহ",
    "মানসিক চাপগ্রস্ত অবস্থায় আমাদের পদক্ষেপসমূহ",
    "মানসিক স্বাস্থ্য ভালো রাখতে আমাদের পদক্ষেপসমূহ",
    "নিজেকে ভাল রাখতে যা যা করতে পারেন",
    "মাল্টিটাস্কিং বা একসাথে একাধিক কাজ করা",
    "সময়কে নিয়ন্ত্রণ করি",
    "পারিবারিক বন্ধন বা সম্পর্ক ভালো রাখতে আমাদের পদক্ষেপসমূহ",
    "সামাজিক বন্ধন সুন্দর করতে আমরা কিছু ইতিবাচক অভ্যাস গড়ে তুলতে  পারি",
    "ইমোশনাল ব্যাংক অ্যাকাউন্ট",
    "অতিরিক্ত মোবাইল ফোন ব্যবহারের ফলাফল",
  ];

  final List<String> videoUrls = [
    "https://f003.backblazeb2.com/file/monon-audio/Written+Documents/WD1_%E0%A6%AE%E0%A6%BE%E0%A6%A8%E0%A6%B8%E0%A6%BF%E0%A6%95+%E0%A6%B8%E0%A7%8D%E0%A6%AC%E0%A6%BE%E0%A6%B8%E0%A7%8D%E0%A6%A5%E0%A7%8D%E0%A6%AF+%E0%A6%B8%E0%A6%AE%E0%A7%8D%E0%A6%AA%E0%A6%B0%E0%A7%8D%E0%A6%95%E0%A7%87+%E0%A6%9C%E0%A6%BE%E0%A6%A8%E0%A6%BF+.mp4",
    "https://f003.backblazeb2.com/file/monon-audio/Written+Documents/WD2_%E0%A6%A8%E0%A6%BF%E0%A6%9C%E0%A7%87%E0%A6%B0+%E0%A6%B8%E0%A6%AE%E0%A7%8D%E0%A6%AA%E0%A6%B0%E0%A7%8D%E0%A6%95%E0%A7%87+%E0%A6%9C%E0%A6%BE%E0%A6%A8%E0%A6%BF+.mp4",
    "https://f003.backblazeb2.com/file/monon-audio/Written+Documents/WD3_%E0%A6%86%E0%A6%A4%E0%A7%8D%E0%A6%AE%E0%A6%B8%E0%A6%9A%E0%A7%87%E0%A6%A4%E0%A6%A8%E0%A6%A4%E0%A6%BE+%E0%A6%AC%E0%A6%BE%E0%A7%9C%E0%A6%BE%E0%A6%87.mp4",
    "https://f003.backblazeb2.com/file/monon-audio/Written+Documents/WD4_%E0%A6%A8%E0%A6%BF%E0%A6%9C%E0%A7%87%E0%A6%B0+%E0%A6%B8%E0%A6%BE%E0%A6%A5%E0%A7%87+%E0%A6%AA%E0%A6%9C%E0%A6%BF%E0%A6%9F%E0%A6%BF%E0%A6%AD+%E0%A6%AC%E0%A6%BE+%E0%A6%87%E0%A6%A4%E0%A6%BF%E0%A6%AC%E0%A6%BE%E0%A6%9A%E0%A6%95+%E0%A6%95%E0%A6%A5%E0%A6%BE+%E0%A6%AC%E0%A6%B2%E0%A6%BF+.mp4",
    "https://f003.backblazeb2.com/file/monon-audio/Written+Documents/WD5_%E0%A6%B8%E0%A6%AE%E0%A6%BE%E0%A6%A8%E0%A7%81%E0%A6%AD%E0%A7%82%E0%A6%A4%E0%A6%BF+%E0%A6%AC%E0%A6%BE+%E0%A6%B8%E0%A6%AE%E0%A6%AE%E0%A6%B0%E0%A7%8D%E0%A6%AE%E0%A6%BF%E0%A6%A4%E0%A6%BE+%E0%A6%AC%E0%A7%83%E0%A6%A6%E0%A7%8D%E0%A6%A7%E0%A6%BF+%E0%A6%95%E0%A6%B0%E0%A6%BF+.mp4",
    "https://f003.backblazeb2.com/file/monon-audio/Written+Documents/WD6_%E0%A6%85%E0%A6%AA%E0%A6%B0%E0%A7%87%E0%A6%B0+%E0%A6%86%E0%A6%AC%E0%A7%87%E0%A6%97-%E0%A6%85%E0%A6%A8%E0%A7%81%E0%A6%AD%E0%A7%82%E0%A6%A4%E0%A6%BF%E0%A6%B0+%E0%A6%A6%E0%A6%BF%E0%A6%95%E0%A7%87+%E0%A6%B2%E0%A6%95%E0%A7%8D%E0%A6%B7%E0%A7%8D%E0%A6%AF+%E0%A6%B0%E0%A6%BE%E0%A6%96%E0%A6%BF+.mp4",
    "https://f003.backblazeb2.com/file/monon-audio/Written+Documents/WD7_+%E0%A6%86%E0%A6%AE%E0%A6%BE%E0%A6%B0+%E0%A6%95%E0%A6%A5%E0%A6%BE+%E0%A6%AC%E0%A6%BE+%E0%A6%86%E0%A6%9A%E0%A6%B0%E0%A6%A3%E0%A7%87+%E0%A6%95%E0%A7%87%E0%A6%89+%E0%A6%AF%E0%A7%87%E0%A6%A8+%E0%A6%95%E0%A6%B7%E0%A7%8D%E0%A6%9F+%E0%A6%A8%E0%A6%BE+%E0%A6%AA%E0%A6%BE%E0%A7%9F+.mp4",
    "https://f003.backblazeb2.com/file/monon-audio/Written+Documents/WD8_%E0%A6%A8%E0%A6%A8%E0%A6%AD%E0%A6%BE%E0%A6%AF%E0%A6%BC%E0%A7%8B%E0%A6%B2%E0%A7%87%E0%A6%A8%E0%A7%8D%E0%A6%9F+%E0%A6%95%E0%A6%AE%E0%A6%BF%E0%A6%89%E0%A6%A8%E0%A6%BF%E0%A6%95%E0%A7%87%E0%A6%B6%E0%A6%A8+(NVC)+%E0%A6%AC%E0%A6%BE+%E0%A6%B8%E0%A6%AE%E0%A6%BE%E0%A6%A8%E0%A7%81%E0%A6%AD%E0%A7%82%E0%A6%A4%E0%A6%BF%E0%A6%B6%E0%A7%80%E0%A6%B2+%E0%A6%AF%E0%A7%8B%E0%A6%97%E0%A6%BE%E0%A6%AF%E0%A7%8B%E0%A6%97+.mp4",
    "https://f003.backblazeb2.com/file/monon-audio/Written+Documents/WD9%2C10_%E0%A6%AC%E0%A6%BF%E0%A6%AD%E0%A6%BF%E0%A6%A8%E0%A7%8D%E0%A6%A8+%E0%A6%AE%E0%A6%BE%E0%A6%A8%E0%A6%B8%E0%A6%BF%E0%A6%95+%E0%A6%9A%E0%A6%BE%E0%A6%AA%E0%A7%87%E0%A6%B0+%E0%A6%B2%E0%A6%95%E0%A7%8D%E0%A6%B7%E0%A6%A3%E0%A6%B8%E0%A6%AE%E0%A7%82%E0%A6%B9_%E0%A6%AE%E0%A6%BE%E0%A6%A8%E0%A6%B8%E0%A6%BF%E0%A6%95+%E0%A6%9A%E0%A6%BE%E0%A6%AA%E0%A6%97%E0%A7%8D%E0%A6%B0%E0%A6%B8%E0%A7%8D%E0%A6%A4+%E0%A6%85%E0%A6%AC%E0%A6%B8%E0%A7%8D%E0%A6%A5%E0%A6%BE%E0%A7%9F+%E0%A6%86%E0%A6%AE%E0%A6%BE%E0%A6%A6%E0%A7%87%E0%A6%B0+%E0%A6%AA%E0%A6%A6%E0%A6%95%E0%A7%8D%E0%A6%B7%E0%A7%87%E0%A6%AA%E0%A6%B8%E0%A6%AE%E0%A7%82%E0%A6%B9++.mp4",
    "https://f003.backblazeb2.com/file/monon-audio/Written+Documents/WD9%2C10_%E0%A6%AC%E0%A6%BF%E0%A6%AD%E0%A6%BF%E0%A6%A8%E0%A7%8D%E0%A6%A8+%E0%A6%AE%E0%A6%BE%E0%A6%A8%E0%A6%B8%E0%A6%BF%E0%A6%95+%E0%A6%9A%E0%A6%BE%E0%A6%AA%E0%A7%87%E0%A6%B0+%E0%A6%B2%E0%A6%95%E0%A7%8D%E0%A6%B7%E0%A6%A3%E0%A6%B8%E0%A6%AE%E0%A7%82%E0%A6%B9_%E0%A6%AE%E0%A6%BE%E0%A6%A8%E0%A6%B8%E0%A6%BF%E0%A6%95+%E0%A6%9A%E0%A6%BE%E0%A6%AA%E0%A6%97%E0%A7%8D%E0%A6%B0%E0%A6%B8%E0%A7%8D%E0%A6%A4+%E0%A6%85%E0%A6%AC%E0%A6%B8%E0%A7%8D%E0%A6%A5%E0%A6%BE%E0%A7%9F+%E0%A6%86%E0%A6%AE%E0%A6%BE%E0%A6%A6%E0%A7%87%E0%A6%B0+%E0%A6%AA%E0%A6%A6%E0%A6%95%E0%A7%8D%E0%A6%B7%E0%A7%87%E0%A6%AA%E0%A6%B8%E0%A6%AE%E0%A7%82%E0%A6%B9++.mp4",
    "https://f003.backblazeb2.com/file/monon-audio/Written+Documents/WD11_%E0%A6%AE%E0%A6%BE%E0%A6%A8%E0%A6%B8%E0%A6%BF%E0%A6%95+%E0%A6%B8%E0%A7%8D%E0%A6%AC%E0%A6%BE%E0%A6%B8%E0%A7%8D%E0%A6%A5%E0%A7%8D%E0%A6%AF+%E0%A6%AD%E0%A6%BE%E0%A6%B2%E0%A7%8B+%E0%A6%B0%E0%A6%BE%E0%A6%96%E0%A6%A4%E0%A7%87+%E0%A6%86%E0%A6%AE%E0%A6%BE%E0%A6%A6%E0%A7%87%E0%A6%B0+%E0%A6%AA%E0%A6%A6%E0%A6%95%E0%A7%8D%E0%A6%B7%E0%A7%87%E0%A6%AA%E0%A6%B8%E0%A6%AE%E0%A7%82%E0%A6%B9+.mp4",
    "https://f003.backblazeb2.com/file/monon-audio/Written+Documents/WD12_%E0%A6%A8%E0%A6%BF%E0%A6%9C%E0%A7%87%E0%A6%95%E0%A7%87+%E0%A6%AD%E0%A6%BE%E0%A6%B2+%E0%A6%B0%E0%A6%BE%E0%A6%96%E0%A6%A4%E0%A7%87+%E0%A6%AF%E0%A6%BE+%E0%A6%AF%E0%A6%BE+%E0%A6%95%E0%A6%B0%E0%A6%A4%E0%A7%87+%E0%A6%AA%E0%A6%BE%E0%A6%B0%E0%A7%87%E0%A6%A8+.mp4",
    "https://f003.backblazeb2.com/file/monon-audio/Written+Documents/WD13_%E0%A6%AE%E0%A6%BE%E0%A6%B2%E0%A7%8D%E0%A6%9F%E0%A6%BF%E0%A6%9F%E0%A6%BE%E0%A6%B8%E0%A7%8D%E0%A6%95%E0%A6%BF%E0%A6%82+%E0%A6%AC%E0%A6%BE+%E0%A6%8F%E0%A6%95%E0%A6%B8%E0%A6%BE%E0%A6%A5%E0%A7%87+%E0%A6%8F%E0%A6%95%E0%A6%BE%E0%A6%A7%E0%A6%BF%E0%A6%95+%E0%A6%95%E0%A6%BE%E0%A6%9C+%E0%A6%95%E0%A6%B0%E0%A6%BE++.mp4",
    "https://f003.backblazeb2.com/file/monon-audio/Written+Documents/WD14_%E0%A6%B8%E0%A6%AE%E0%A7%9F%E0%A6%95%E0%A7%87+%E0%A6%A8%E0%A6%BF%E0%A7%9F%E0%A6%A8%E0%A7%8D%E0%A6%A4%E0%A7%8D%E0%A6%B0%E0%A6%A3+%E0%A6%95%E0%A6%B0%E0%A6%BF+.mp4",
    "https://f003.backblazeb2.com/file/monon-audio/Written+Documents/WD15_%E0%A6%AA%E0%A6%BE%E0%A6%B0%E0%A6%BF%E0%A6%AC%E0%A6%BE%E0%A6%B0%E0%A6%BF%E0%A6%95+%E0%A6%AC%E0%A6%A8%E0%A7%8D%E0%A6%A7%E0%A6%A8+%E0%A6%AC%E0%A6%BE+%E0%A6%B8%E0%A6%AE%E0%A7%8D%E0%A6%AA%E0%A6%B0%E0%A7%8D%E0%A6%95+%E0%A6%AD%E0%A6%BE%E0%A6%B2%E0%A7%8B+%E0%A6%B0%E0%A6%BE%E0%A6%96%E0%A6%A4%E0%A7%87+%E0%A6%86%E0%A6%AE%E0%A6%BE%E0%A6%A6%E0%A7%87%E0%A6%B0+%E0%A6%AA%E0%A6%A6%E0%A6%95%E0%A7%8D%E0%A6%B7%E0%A7%87%E0%A6%AA%E0%A6%B8%E0%A6%AE%E0%A7%82%E0%A6%B9+.mp4",
    "https://f003.backblazeb2.com/file/monon-audio/Written+Documents/WD16_%E0%A6%B8%E0%A6%BE%E0%A6%AE%E0%A6%BE%E0%A6%9C%E0%A6%BF%E0%A6%95+%E0%A6%AC%E0%A6%A8%E0%A7%8D%E0%A6%A7%E0%A6%A8+%E0%A6%B8%E0%A7%81%E0%A6%A8%E0%A7%8D%E0%A6%A6%E0%A6%B0+%E0%A6%95%E0%A6%B0%E0%A6%A4%E0%A7%87+%E0%A6%86%E0%A6%AE%E0%A6%B0%E0%A6%BE+%E0%A6%95%E0%A6%BF%E0%A6%9B%E0%A7%81+%E0%A6%87%E0%A6%A4%E0%A6%BF%E0%A6%AC%E0%A6%BE%E0%A6%9A%E0%A6%95+%E0%A6%85%E0%A6%AD%E0%A7%8D%E0%A6%AF%E0%A6%BE%E0%A6%B8+%E0%A6%97%E0%A7%9C%E0%A7%87+%E0%A6%A4%E0%A7%81%E0%A6%B2%E0%A6%A4%E0%A7%87++%E0%A6%AA%E0%A6%BE%E0%A6%B0%E0%A6%BF.mp4",
    "https://f003.backblazeb2.com/file/monon-audio/Written+Documents/WD17_%E0%A6%87%E0%A6%AE%E0%A7%8B%E0%A6%B6%E0%A6%A8%E0%A6%BE%E0%A6%B2+++%E0%A6%AC%E0%A7%8D%E0%A6%AF%E0%A6%BE%E0%A6%82%E0%A6%95+%E0%A6%85%E0%A7%8D%E0%A6%AF%E0%A6%BE%E0%A6%95%E0%A6%BE%E0%A6%89%E0%A6%A8%E0%A7%8D%E0%A6%9F+.mp4",
    "https://f003.backblazeb2.com/file/monon-audio/Written+Documents/WD18_%E0%A6%85%E0%A6%A4%E0%A6%BF%E0%A6%B0%E0%A6%BF%E0%A6%95%E0%A7%8D%E0%A6%A4+%E0%A6%AE%E0%A7%8B%E0%A6%AC%E0%A6%BE%E0%A6%87%E0%A6%B2+%E0%A6%AB%E0%A7%8B%E0%A6%A8+%E0%A6%AC%E0%A7%8D%E0%A6%AF%E0%A6%AC%E0%A6%B9%E0%A6%BE%E0%A6%B0%E0%A7%87%E0%A6%B0+%E0%A6%AB%E0%A6%B2%E0%A6%BE%E0%A6%AB%E0%A6%B2+.mp4",

  ];

  final List<Color> cardColors = [
    Colors.white, // Light Blue
    ColorUtil.writtenDoc, // Light Yellow
  ];

   WrittenDocumentsPage({super.key});

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
                    builder: (context) => WrittenDocumentsPlayer(
                      title: titles[index],
                      url: videoUrls[index],
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
      title: const Text("কিছু কথা", style: TextStyle(color: Colors.white, fontSize: 18)),
      centerTitle: true,
      backgroundColor: ColorUtil.primary,
      leading: IconButton(
        icon: const Icon(Icons.close, color: Colors.white),
        onPressed: () {
          NavigationService.getCurrentState()?.pop();
        },
      ),
    );
  }
}