import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monon/util/image_util.dart';

import '../../route/navigation_service.dart';
import '../../util/color_util.dart';
import 'activity_item/activity1.dart';
import 'activity_item/activity10.dart';
import 'activity_item/activity11.dart';
import 'activity_item/activity12.dart';
import 'activity_item/activity2.dart';
import 'activity_item/activity3.dart';
import 'activity_item/activity4.dart';
import 'activity_item/activity5.dart';
import 'activity_item/activity6.dart';
import 'activity_item/activity7.dart';
import 'activity_item/activity8.dart';
import 'activity_item/activity9.dart';

class ActivitiesMain extends StatefulWidget {

  const ActivitiesMain({super.key});
  @override
  State<ActivitiesMain> createState() => _ActivitiesMainState();
}

class _ActivitiesMainState extends State<ActivitiesMain>
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

  final List<ActivityItem> activities = [
    ActivityItem("নিজের সম্পর্কে জানি", "Discovering myself and understand who I am", ImageUtil.ACT_SELF_AWARENESS, const Activity1()),
    ActivityItem("আবেগের বিভিন্ন পরিস্থিতিতে আমি কি করি", "Analyze my responses to various emotions", ImageUtil.UNDERSTANDING_EMOTIONS, const Activity2()),
    ActivityItem("নিজের মানসিক শক্তি এবং দুর্বলতাগুলো জানি", "List my strengths and weaknesses", ImageUtil.STRENGth_AND_WEAKNESS, const Activity3()),
    ActivityItem("নিজের সাথে পজিটিভ বা ইতিবাচক কথা বলার অভ্যাস করি", "Practice speaking to yourself positively", ImageUtil.POSITIVE_SELF_TALK, const Activity4()),
    ActivityItem("কাছের মানুষের প্রতি সচেতনতা বাড়াই ও যত্নশীল হই", "Become more aware to friends and family", ImageUtil.CARING_LOVED_ONES, const Activity5()),
    ActivityItem("অন্যদের ভালো গুণাবলীগুলোকে রপ্ত করি", "Adopt the positive traits of people around you", ImageUtil.LEARNING_FROM_OTHERS, const Activity6()),
    ActivityItem("নিজেকে সময় দেই", "Make time regularly to rest, reflect and recharge", ImageUtil.TIME_FOR_SELF, const Activity7()),
    ActivityItem("সমানুভূতি বা সমমর্মিতার চর্চা করি", "Develop your ability to understand others", ImageUtil.EMPATHY_PRACTICE, const Activity8()),
    ActivityItem("ননভায়োলেন্ট কমিউনিকেশন বা সমানুভূতিশীল যোগাযোগ", "Learn to express yourself respectfully", ImageUtil.COMPASSIONATE_COMMUNICATION, const Activity9()),
    ActivityItem("বর্তমান জীবনের নিয়ন্ত্রিত ও অনিয়ন্ত্রিত ঘটনা বা বিষয়বস্তুগুলো নিয়ে অবগত হই", "Reflect on the events of your life to better understand patterns", ImageUtil.LIFE_REFLECTION, const Activity10()),
    ActivityItem("সামাজিক যোগাযোগ বাড়াই ও সামাজিক বন্ধন সুন্দর করি", "Build supportive social connections", ImageUtil.SOCIAL_BONDING, const Activity11()),
    ActivityItem("ক্ষমা করার অভ্যাস চর্চা করি", "Cultivate the habit of forgiveness", ImageUtil.FORGIVENESS_PRACTICE, const Activity12()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          final activity = activities[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: (index % 2 == 0)
                      ? ColorUtil.primary.shade300
                      : Colors.grey.shade200, // background color
                  borderRadius: BorderRadius.circular(15), // rounded corners
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0), // optional padding
                  child: Image.asset(
                    activity.imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              title: Text(activity.title, style: const TextStyle(fontWeight: FontWeight.w500)),
              // subtitle: Text(activity.subtitle),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => activity.page),
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
      title: const Text(
        "আমার কাজ",
        style: TextStyle(color: Colors.white, fontSize: 18.0),
      ),
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
      backgroundColor: ColorUtil.primary,
      iconTheme: const IconThemeData(color: Colors.white),
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          NavigationService.getCurrentState()?.pop();
        },
      ),
    );
  }
}

class ActivityItem {
  final String title;
  final String subtitle;
  final String imagePath;
  final Widget page;

  ActivityItem(this.title, this.subtitle, this.imagePath, this.page);
}

