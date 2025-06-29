import 'dart:async';

import 'package:flutter/material.dart';
import 'package:monon/route/navigation_service.dart';
import 'package:monon/shared_pref/shared_pref_util.dart';
import 'package:monon/ui/home/pathArgumentHome.dart';
import 'package:monon/util/color_util.dart';
import 'package:monon/util/image_util.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkLoginStatus();
    });
  }

  Future<void> checkLoginStatus() async {
    final isLoggedIn = await SharedPrefUtil().getIsLoggedIn();
    final isIntroCompleted = await SharedPrefUtil().getIsTntro();


    if (!mounted) return;

    if (isLoggedIn && isIntroCompleted) {
      // Navigator.pushReplacementNamed(context, '/emotions_first_submit');
      Timer(const Duration(seconds: 3), () {
        NavigationService.getCurrentState()
            ?.pushReplacementNamed('/emotions_first_submit');
      });
    } else if (isLoggedIn && !isIntroCompleted) {
      Navigator.pushReplacementNamed(context, '/welcome');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Optional
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Center(
              child: Text(
                "মনন",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageUtil.LOGIN_MONON_ICON,
                    key: const Key('logo-image'),
                    width: 250,
                    fit: BoxFit.contain,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: LinearProgressIndicator(color: ColorUtil.mainColor, minHeight: 10.0, backgroundColor: Colors.grey,),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                "Powered by \nDepartment of Public Health and Informatics "
                    "\nBangladesh Medical University \nShahbag, Dhaka-1000,Bangladesh",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
