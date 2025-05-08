import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../route/navigation_service.dart';
import '../../../util/color_util.dart';


class Activity12 extends StatefulWidget {

  const Activity12({super.key});
  @override
  State<Activity12> createState() => _Activity12State();
}

class _Activity12State extends State<Activity12> {
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
      body: Container(
        padding: const EdgeInsets.all(16.0),
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
        "Activities 12",
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

