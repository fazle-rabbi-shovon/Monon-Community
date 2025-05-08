import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    ActivityItem("Self-awareness", "Discovering myself and understand who I am", Icons.person, const Activity1()),
    ActivityItem("Understanding Emotions", "Analyze my responses to various emotions", Icons.emoji_emotions, const Activity2()),
    ActivityItem("Strengths and Weaknesses", "List my strengths and weaknesses", Icons.scale, const Activity3()),
    ActivityItem("Strengthening Relationships", "Map out close people and be sincere", Icons.group, const Activity4()),
    ActivityItem("Adopting Good Qualities", "Learn from others and develop", Icons.star, const Activity5()),
    ActivityItem("Self-regulation", "Prioritize my well-being", Icons.favorite, const Activity6()),
    ActivityItem("Practicing Forgiveness", "Develop forgiveness habits", Icons.volunteer_activism, const Activity7()),
    ActivityItem("Controlled and Uncontrolled", "Know my limits and control", Icons.compare_arrows, const Activity8()),
    ActivityItem("Motivation", "Encourage and replace negative thoughts", Icons.bolt, const Activity9()),
    ActivityItem("Practicing Empathy", "Understand others’ feelings", Icons.handshake, const Activity10()),
    ActivityItem("Enhancing Social Skills", "Strengthen social bonds", Icons.people, const Activity11()),
    ActivityItem("Anger Management", "Control anger and apply it", Icons.mood_bad, const Activity12()),
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
              leading: CircleAvatar(
                backgroundColor: Colors.deepPurple.shade100,
                child: Icon(activity.icon, color: Colors.deepPurple),
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

class ActivityItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget page;

  ActivityItem(this.title, this.subtitle, this.icon, this.page);
}

