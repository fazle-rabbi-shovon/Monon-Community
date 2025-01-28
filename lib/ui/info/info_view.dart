import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../route/navigation_service.dart';
import '../../util/color_util.dart';
import 'news_item.dart';

class InfoView extends StatefulWidget {

  const InfoView({super.key});
  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView>
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
      body: Column(
        children: [
          // Header with Stories section
          GestureDetector(
            onTap: () {
              // Handle Stories click
              print("Stories clicked");
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        colors: [
                          ColorUtil.primarySwatch[800]!,
                          ColorUtil.primarySwatch[700]!,
                          ColorUtil.primarySwatch[500]!,
                          ColorUtil.primarySwatch[400]!,
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Stories',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Divider for Newsfeed
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            color: ColorUtil.primary.shade700,
            child: const Text(
              'NEWS FEED',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          // News Feed
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ListView.builder(
                itemCount: 8, // Number of news items
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle News Item click
                      print("News Item ${index + 1} clicked");
                    },
                    child: NewsItem(
                      title: 'News Title ${index + 1}',
                      description:
                      'This is a description for news item ${index + 1}.',
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, ),
        backgroundColor: ColorUtil.primary.shade700,
        shape: const CircleBorder(),
      ),
    );
  }

  _appbar(){
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
        child: const Center(

        ),
      ),
      title: const Text(
        // getTranslated(context, "LEAVE_APPLY"),
        "Info",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
      backgroundColor: ColorUtil.primary,
      iconTheme: IconThemeData(color: ColorUtil.primary),
      elevation: 0,
      centerTitle: true,
    );
  }
}

