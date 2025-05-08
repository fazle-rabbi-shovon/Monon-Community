import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monon/Common/normal_gradient_button.dart';
import 'package:monon/Common/yellow_gradient_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../route/navigation_service.dart';
import '../../util/color_util.dart';
import '../../util/dimen_values_util.dart';

class SettingsSubmitView extends StatefulWidget {
  const SettingsSubmitView({super.key});

  @override
  State<SettingsSubmitView> createState() => _SettingsSubmitViewState();
}

class _SettingsSubmitViewState extends State<SettingsSubmitView>
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

  // Replace with the actual help phone number
  final String helpPhoneNumber = '+8801737281391';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: ()  {
                NavigationService.getCurrentState()?.pushNamed('/language_setting');
              },
              child: Container(
                height: 50.0,
                decoration: YellowGradientButtonDecoration(),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        // getTranslated(context, "LOGIN_TITLE"),
                        "Language Setting",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: ()  {
                NavigationService.getCurrentState()?.pushNamed('/Password_changer');
              },
              child: Container(
                height: 50.0,
                decoration: YellowGradientButtonDecoration(),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        // getTranslated(context, "LOGIN_TITLE"),
                        "Password Setting",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget nextButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 20.0),
      height: DimenValuesUtil.buttonHeight,
      decoration: NormalGradientButtonDecoration(),
      child: InkWell(
        onTap: () {
        },
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Next",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: DimenValuesUtil.title,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5),
              Icon(Icons.lock),
            ],
          ),
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
        "Submit",
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
