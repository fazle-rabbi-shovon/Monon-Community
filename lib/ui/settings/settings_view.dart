import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monon/Common/normal_gradient_button_decoration.dart';
import 'package:monon/Common/yellow_gradient_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../route/navigation_service.dart';
import '../../shared_pref/shared_pref_util.dart';
import '../../util/color_util.dart';
import '../../util/dimen_values_util.dart';
import '../home/confirm_dialogue.dart';
import '../home/emotion_dialogue.dart';

// ignore: must_be_immutable
class SettingsView extends StatefulWidget {
   SettingsView( {super.key});



  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView>
    with SingleTickerProviderStateMixin {

  String userRole = "volunteer";

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

  Future<void> afterBuild() async {
     userRole = (await SharedPrefUtil().getUserRole())!;
     setState(() {

     });
  }

  // Replace with the actual help phone number
  final String helpPhoneNumber = '+8801737281391';

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) => afterBuild());

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
                // NavigationService.getCurrentState()?.pushNamed('/settings_submit');
                NavigationService.getCurrentState()?.pushNamed('/Password_changer');
              },
              child: Container(
                height: 50.0,
                decoration: GradientButtonDecoration(),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        // getTranslated(context, "LOGIN_TITLE"),
                        "পাসওয়ার্ড পরিবর্তন",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
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
                NavigationService.getCurrentState()?.pushNamed('/personal_info_update');
              },
              child: Container(
                height: 50.0,
                decoration: GradientButtonDecoration(),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        // getTranslated(context, "LOGIN_TITLE"),
                        "প্রোফাইল আপডেট",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Visibility(
              visible: !(userRole == "participant"),
              child: GestureDetector(
                onTap: ()  {
                  if(userRole == "admin"){
                    NavigationService.getCurrentState()?.pushNamed('/volunteer_creation');
                  }else{
                    NavigationService.getCurrentState()?.pushNamed('/participant_creation');
                  }

                },
                child: Container(
                  height: 50.0,
                  decoration: GradientButtonDecoration(),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          // getTranslated(context, "LOGIN_TITLE"),
                          "একাউন্ট তৈরি",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (Platform.isIOS && userRole != "participant")
             const SizedBox(height: 30),
            if (Platform.isIOS)
            GestureDetector(
              // onTap: () => _handleIOSExit(context),
              onTap: () => _handleIOSExit(context),
              child: Container(
                height: 50.0,
                decoration: GradientButtonDecoration(),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        // getTranslated(context, "LOGIN_TITLE"),
                        "এক্সিট",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleIOSExit(BuildContext context) async {
    final needHelp = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const ConfirmHelpDialog(),
    );

    if (needHelp == true) {
      final shouldExit = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (_) => const EmotionDialog(),
      );
      if (shouldExit == true) {
        _goBackgroundIOS(context);
      }
    } else {
        _goBackgroundIOS(context);

    }
  }

  void _goBackgroundIOS(BuildContext context) {
    // Close all dialogs / pages
    Navigator.of(context, rootNavigator: true)
        .popUntil((route) => route.isFirst);

    // Optional: send app to background (Apple-safe)
    Future.delayed(const Duration(milliseconds: 200), () {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    });
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
        "সেটিংস",
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
