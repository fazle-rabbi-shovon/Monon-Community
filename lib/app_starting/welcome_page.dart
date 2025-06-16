import 'dart:async';
import 'package:flutter/material.dart';
import 'package:monon/ui/home/home_view.dart';

import '../route/navigation_service.dart';
import '../util/image_util.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    // Navigate after 5 seconds
    Timer(const Duration(seconds: 5), () {
      NavigationService.getCurrentState()
          ?.pushReplacementNamed('/personal_info',);
    });
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
                "মনন অ্যাপে আপনাকে স্বাগতম",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: Image.asset(
                ImageUtil.LOGIN_MONON_ICON,
                key: const Key('logo-image'),
                width: 250,
                fit: BoxFit.contain,
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
