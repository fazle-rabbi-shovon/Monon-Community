import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monon/Common/normal_button.dart';

import '../../route/navigation_service.dart';
import '../../util/color_util.dart';

class PasswordChanger extends StatefulWidget {
  const PasswordChanger({super.key});

  @override
  State<PasswordChanger> createState() => _PasswordChangerState();
}

class _PasswordChangerState extends State<PasswordChanger> {
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

  final _emailController = TextEditingController();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  bool isLoading = false;

  void _changePassword() async {
    setState(() => isLoading = true);

    final email = _emailController.text.trim();
    final currentPassword = _currentPasswordController.text.trim();
    final newPassword = _newPasswordController.text.trim();

    try {
      final user = FirebaseAuth.instance.currentUser!;
      final credential = EmailAuthProvider.credential(
        email: email,
        password: currentPassword,
      );

      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);

      if(mounted){
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('সফল', style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600),),
            content: const Text('আপনার পাসওয়ার্ড পরিবর্তন করা হয়েছে হয়েছে।'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  NavigationService.getCurrentState()?.pop();
                },
                child: const Text("ঠিক আছে", style: TextStyle(color: ColorUtil.button)),
              )
            ],
          ),
        );

      }

    } catch (e) {
      if(mounted){
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('সফল হয়নি ❌', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),),
            content: const Text("আপনার পাসওয়ার্ড পরিবর্তন হয় নি।"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("ঠিক আছে", style: TextStyle(color: ColorUtil.button)),
              )
            ],
          ),
        );
      }

    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _currentPasswordController,
              decoration: InputDecoration(labelText: "Current Password"),
              obscureText: true,
            ),
            TextField(
              controller: _newPasswordController,
              decoration: InputDecoration(labelText: "New Password"),
              obscureText: true,
            ),
            SizedBox(height: 24),
            isLoading
                ? CircularProgressIndicator()
                // : ElevatedButton(
                //     onPressed: _changePassword,
                //     child: Text("Change Password"),
                //   ),
                : NormalButton(false, "পরিবর্তন করুন", onTap: _changePassword)
          ],
        ),
      ),
    );
  }

  _appbar() {
    return AppBar(
      title:  const Text(
        // getTranslated(context, "LEAVE_APPLY"),
        "পাসওয়ার্ড পরিবর্তন",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
      centerTitle: true,
      backgroundColor: ColorUtil.primary,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          NavigationService.getCurrentState()?.pop();
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            NavigationService.getCurrentState()?.pop();
          },
        ),
      ],
    );
  }
}
