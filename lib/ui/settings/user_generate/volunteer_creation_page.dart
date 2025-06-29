import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:monon/util/color_util.dart';

import '../../../Common/login_gradient_button_decoration.dart';
import '../../../route/navigation_service.dart';
import '../../../util/dimen_values_util.dart';


class VolunteerCreationPage extends StatefulWidget {
  const VolunteerCreationPage({super.key});

  @override
  State<VolunteerCreationPage> createState() => _VolunteerCreationPageState();
}

class _VolunteerCreationPageState extends State<VolunteerCreationPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final idController = TextEditingController();
  final participant1NameController = TextEditingController();
  final participant1IdController = TextEditingController();
  final participant2NameController = TextEditingController();
  final participant2IdController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    idController.dispose();
    participant1NameController.dispose();
    participant1IdController.dispose();
    participant2NameController.dispose();
    participant2IdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'ভলান্টিয়ার তৈরি করুন',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildInput('ভলান্টিয়ারের নাম', nameController),
                  _buildInput('ইমেইল', emailController),
                  _buildInput('পাসওয়ার্ড', passwordController, isPassword: true),
                  _buildInput('ভলান্টিয়ার আইডি', idController),
                  const SizedBox(height: 10),
                  const Text(
                    'পার্টিসিপেন্ট ১ এর তথ্য',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  _buildInput('নাম', participant1NameController),
                  _buildInput('আইডি', participant1IdController),
                  const SizedBox(height: 10),
                  const Text(
                    'পার্টিসিপেন্ট ২ এর তথ্য',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  _buildInput('নাম', participant2NameController),
                  _buildInput('আইডি', participant2IdController),
                  const SizedBox(height: 10),
                  _submitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 20.0),
      height: DimenValuesUtil.buttonHeight,
      decoration: GradientButtonDecoration(),
      child: InkWell(
        onTap: submitVolunteer,
        child: const Center(
          child: Text(
            "সাবমিট",
            style: TextStyle(
              color: Colors.white,
              fontSize: DimenValuesUtil.title,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void submitVolunteer() async {
    if (_formKey.currentState!.validate()) {
      try {
        final currentUserUid = FirebaseAuth.instance.currentUser?.uid;
        if (currentUserUid == null) {
          throw Exception("User not authenticated");
        }

        final data = {
          'volunteerName': nameController.text.trim(),
          'volunteerEmail': emailController.text.trim(),
          'volunteerPassword': passwordController.text.trim(),
          'volunteerId': idController.text.trim(),
          'userRole' : "volunteer",
          'participant1Name': participant1NameController.text.trim(),
          'participant1Id': participant1IdController.text.trim(),
          'participant2Name': participant2NameController.text.trim(),
          'participant2Id': participant2IdController.text.trim(),
          'createdBy': FirebaseAuth.instance.currentUser?.uid,
          'createdAt': FieldValue.serverTimestamp(),
        };

        await FirebaseFirestore.instance
            .collection('volunteer_email_requests')
            .add(data);


        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("✅ সফল হয়েছে"),
            content: const Text('আপনি সফলভাবে একটি ভলান্টিয়ার একাউন্ট তৈরি করেছেন'),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: const Text("ওকে"))
            ],
          ),
        );

        // NavigationService.getCurrentState()?.pop();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ত্রুটি হয়েছে: $e')),
        );
      }
    }
  }

  Widget _buildInput(String label, TextEditingController controller, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorUtil.mainColor),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorUtil.button, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        validator: (value) =>
        value == null || value.isEmpty ? 'ঘরটি পূরণ করুন' : null,
      ),
    );
  }
}
