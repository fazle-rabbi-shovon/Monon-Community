import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:monon/util/color_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Common/login_gradient_button_decoration.dart';
import '../../../route/navigation_service.dart';
import '../../../shared_pref/shared_pref_util.dart';
import '../../../util/dimen_values_util.dart';

class ParticipantCreationPage extends StatefulWidget {
  const ParticipantCreationPage({super.key});

  @override
  State<ParticipantCreationPage> createState() => _ParticipantCreationPageState();
}

class _ParticipantCreationPageState extends State<ParticipantCreationPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final idController = TextEditingController();

  String? selectedParticipantName;
  List<Map<String, String>> participantOptions = [];

  @override
  void initState() {
    super.initState();
    fetchParticipantOptions();
  }

  Future<void> fetchParticipantOptions() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final data = doc.data();
    if (data != null && data['participants'] != null) {
      final participants = Map<String, dynamic>.from(data['participants']);
      setState(() {
        participantOptions = [
          if (participants['participant1'] != null)
            {
              'name': participants['participant1']['name'],
              'id': participants['participant1']['id']
            },
          if (participants['participant2'] != null)
            {
              'name': participants['participant2']['name'],
              'id': participants['participant2']['id']
            },
        ];
        if (participantOptions.isNotEmpty) {
          selectedParticipantName = participantOptions[0]['name'];
          idController.text = participantOptions[0]['id']!;
        }
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    idController.dispose();
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
                    'পার্টিসিপেন্ট তৈরি করুন',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildDropdown(),
                  _buildInput('ইমেইল', emailController),
                  _buildInput('পাসওয়ার্ড', passwordController, isPassword: true),
                  // _buildInput('আইডি', idController, enabled: false),
                  const SizedBox(height: 10),
                  _submitButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: DropdownButtonFormField<String>(
        value: selectedParticipantName,
        decoration: InputDecoration(
          labelText: 'নাম',
          labelStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorUtil.mainColor),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorUtil.button, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        items: participantOptions.map((participant) {
          return DropdownMenuItem<String>(
            value: participant['name'],
            child: Text(participant['name']!),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedParticipantName = value;
            final selected = participantOptions.firstWhere((p) => p['name'] == value);
            idController.text = selected['id']!;
          });
        },
        validator: (value) => value == null ? 'ঘরটি পূরণ করুন' : null,
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 20.0),
      height: DimenValuesUtil.buttonHeight,
      decoration: GradientButtonDecoration(),
      child: InkWell(
        onTap: () async {
          final status = await SharedPrefUtil().checkParticipantList(int.parse(idController.text));
          final alreadyExists = status['alreadyExists']!;
          final isFull = status['isFull']!;

          if (alreadyExists) {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text("সফল হয়নি"),
                content: const Text('⛔ এই পার্টিসিপেন্ট তৈরি করা হয়েছে'),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context), child: const Text("ওকে"))
                ],
              ),
            );
          } else if (isFull) {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text("সফল হয়নি"),
                content: const Text('⛔ এই ভলান্টিয়ার ইতোমধ্যে দুইজন পার্টিসিপেন্ট একাউন্ট তৈরি করেছেন'),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context), child: const Text("ওকে"))
                ],
              ),
            );
          } else {
            submitParticipant;
          }
        },
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



  void submitParticipant() async {
    if (_formKey.currentState!.validate()) {
      try {
        final currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser != null && currentUser.isAnonymous) {
          await currentUser.delete();
          await FirebaseAuth.instance.signOut();
        }

        // (Optional) Re-authenticate if needed here, e.g., admin login

        final currentUserUid = FirebaseAuth.instance.currentUser?.uid;

        // Safety check
        if (currentUserUid == null) {
          throw Exception("User not authenticated");
        }

        final data = {
          'participantName': selectedParticipantName,
          'participantEmail': emailController.text.trim(),
          'participantPassword': passwordController.text.trim(),
          'participantId': idController.text.trim(),
          'userRole' : "participant",
          'participant1Name': "Nai",
          'participant1Id': "Nai",
          'participant2Name': "Nai",
          'participant2Id': "Nai",
          'createdBy': FirebaseAuth.instance.currentUser?.uid,
          'createdAt': FieldValue.serverTimestamp(),
        };

        await FirebaseFirestore.instance
            .collection('participant_by_volunteer')
            .add(data);

        await SharedPrefUtil().insertParticipantList(int.parse(idController.text));

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('সফলভাবে সাবমিট হয়েছে')),
        );

        //
        // Go back after delay
        Future.delayed(const Duration(seconds: 2), () {
          NavigationService.getCurrentState()?.pop();
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ত্রুটি হয়েছে: $e')),
        );
      }
    }
  }

  Widget _buildInput(String label, TextEditingController controller, {bool isPassword = false, bool enabled = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        enabled: enabled,
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
