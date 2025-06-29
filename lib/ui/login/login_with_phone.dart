import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../util/color_util.dart';
import '../../../util/image_util.dart';
import '../../Common/login_button.dart';
import '../../route/navigation_service.dart';
import '../../shared_pref/shared_pref_util.dart';

class PhoneLoginView extends StatefulWidget {
  const PhoneLoginView({super.key});

  @override
  State<PhoneLoginView> createState() => _PhoneLoginViewState();
}

class _PhoneLoginViewState extends State<PhoneLoginView> {
  final TextEditingController phoneController = TextEditingController();
  bool isLoading = false;
  String? userRole;

  void loginWithPhone() async {
    String phone = phoneController.text.trim();
    if (phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("📱 Please enter your phone number")),
      );
      return;
    }

    setState(() => isLoading = true);

    // TODO: Replace with actual Firebase phone auth logic
    await Future.delayed(const Duration(seconds: 2)); // Dummy delay

    setState(() => isLoading = false);

    // Simulate success
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("✅ OTP Sent")),
    );
  }

  Future<void> loginWithPhoneAuto() async {
    String phone = phoneController.text.trim();
    if (phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("📱 Please enter your phone number")),
      );
      return;
    }

    setState(() => isLoading = true);

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+88$phone',
      timeout: const Duration(seconds: 100),

      verificationCompleted: (PhoneAuthCredential credential) async {
        try {
          final userCredential = await FirebaseAuth.instance
              .signInWithCredential(credential);

          if (kDebugMode) print("Auto login successful.............");
          await _postLoginProcessing(userCredential.user);
        } catch (e) {
          if (kDebugMode) print("Auto login failed: $e");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("❌ Auto login failed: $e")),
          );
        }
      },

      verificationFailed: (FirebaseAuthException e) {
        if (kDebugMode) print("Verification failed: ${e.message}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("❌ Verification failed: ${e.message}")),
        );
        setState(() => isLoading = false);
      },

      codeSent: (_, __) {
        // Don't do anything. Waiting for auto verification.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("📩 OTP sent, verifying...")),
        );
      },

      codeAutoRetrievalTimeout: (_) {
        setState(() => isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("⏱️ Auto verification timed out.")),
        );
      },
    );
  }

  Future<void> _postLoginProcessing(User? user) async {
    if (user == null) return;

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (doc.exists) {
      userRole = doc['role'];
      SharedPrefUtil().setLoggedIn();

      if (kDebugMode) print("User role: $userRole");

      NavigationService.getCurrentState()?.pushReplacementNamed('/welcome');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No user record found.")),
      );
    }

    setState(() => isLoading = false);
  }


  void navigateToEmailLogin() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorUtil.primaryDark,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          _backgroundLayout(),
          _foregroundLayout(),
        ],
      ),
    );
  }

  Widget _backgroundLayout() {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Image.asset(
              ImageUtil.LOGIN_MONON_ICON,
              width: 250,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 230),
      ],
    );
  }

  Widget _foregroundLayout() {
    return Positioned(
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            colors: [
              ColorUtil.primarySwatch[700]!,
              ColorUtil.primarySwatch[500]!,
              ColorUtil.primarySwatch[400]!,
              ColorUtil.primarySwatch[300]!,
            ],
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              "LOGIN TO CONTINUE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            _phoneField(),
            const Spacer(),
            LoginButton(isLoading, onTap: loginWithPhoneAuto),
            TextButton(
              onPressed: navigateToEmailLogin,
              child: const Text(
                "Login with email",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _phoneField() {
    return TextField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        hintStyle: TextStyle(color: Colors.grey.shade500),
        labelStyle: TextStyle(color: Colors.grey.shade500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 2, color: ColorUtil.button),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 2, color: ColorUtil.button),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 2, color: ColorUtil.button),
        ),
      ),
    );
  }
}
