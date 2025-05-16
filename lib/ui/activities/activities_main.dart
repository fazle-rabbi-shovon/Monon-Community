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
    ActivityItem("Self-awareness", "Discovering myself and understand who I am", ImageUtil.ACT_SELF_AWARENESS, const Activity1()),
    ActivityItem("Understanding Emotions", "Analyze my responses to various emotions", ImageUtil.UNDERSTANDING_EMOTIONS, const Activity2()),
    ActivityItem("Strengths and Weaknesses", "List my strengths and weaknesses", ImageUtil.STRENGth_AND_WEAKNESS, const Activity3()),
    ActivityItem("Positive Self-Talk", "Practice speaking to yourself positively", ImageUtil.POSITIVE_SELF_TALK, const Activity4()),
    ActivityItem("Caring Loved Ones", "Become more aware to friends and family", ImageUtil.CARING_LOVED_ONES, const Activity5()),
    ActivityItem("Learning from Others", "Adopt the positive traits of people around you", ImageUtil.LEARNING_FROM_OTHERS, const Activity6()),
    ActivityItem("Time for Self", "Make time regularly to rest, reflect and recharge", ImageUtil.TIME_FOR_SELF, const Activity7()),
    ActivityItem("Empathy Practice", "Develop your ability to understand others", ImageUtil.EMPATHY_PRACTICE, const Activity8()),
    ActivityItem("Compassionate Communication", "Learn to express yourself respectfully", ImageUtil.COMPASSIONATE_COMMUNICATION, const Activity9()),
    ActivityItem("Life Reflections", "Reflect on the events of your life to better understand patterns", ImageUtil.LIFE_REFLECTION, const Activity10()),
    ActivityItem("Social Bonding", "Build supportive social connections", ImageUtil.SOCIAL_BONDING, const Activity11()),
    ActivityItem("Forgiveness Practice", "Cultivate the habit of forgiveness", ImageUtil.FORGIVENESS_PRACTICE, const Activity12()),
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
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              title: Text(activity.title, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(activity.subtitle),
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
        "Activity",
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

class ActivityItem {
  final String title;
  final String subtitle;
  final String imagePath;
  final Widget page;

  ActivityItem(this.title, this.subtitle, this.imagePath, this.page);
}

