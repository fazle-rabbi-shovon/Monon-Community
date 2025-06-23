import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:monon/util/color_util.dart';

import '../../Common/login_gradient_button_decoration.dart';
import '../../route/navigation_service.dart';
import '../../util/dimen_values_util.dart';


class PersonalInfoUpdatePage extends StatefulWidget {
  const PersonalInfoUpdatePage({super.key});

  @override
  State<PersonalInfoUpdatePage> createState() => _PersonalInfoUpdatePageState();
}

class _PersonalInfoUpdatePageState extends State<PersonalInfoUpdatePage> {
  final _formKey = GlobalKey<FormState>();

  final uniqueIdController = TextEditingController();
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();
  final districtController = TextEditingController();
  final upazillaController = TextEditingController();
  final relationshipController = TextEditingController();
  final participant1Controller = TextEditingController();
  final participant2Controller = TextEditingController();

  String participantType = 'volunteer';

  @override
  void initState() {
    super.initState();
    _loadPersonalInfo();
  }

  Future<void> _loadPersonalInfo() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final doc = await FirebaseFirestore.instance.collection('personal_info').doc(uid).get();

    if (doc.exists) {
      final data = doc.data()!;
      setState(() {
        uniqueIdController.text = data['unique_id'] ?? '';
        nameController.text = data['name'] ?? '';
        dobController.text = data['dob'] ?? '';
        genderController.text = data['gender'] ?? '';
        districtController.text = data['district'] ?? '';
        upazillaController.text = data['upazilla'] ?? '';
        participantType = data['participant_type'] ?? 'volunteer';
        relationshipController.text = data['relationship'] ?? '';
        participant1Controller.text = data['participant_1'] ?? '';
        participant2Controller.text = data['participant_2'] ?? '';
      });
    }
  }

  @override
  void dispose() {
    uniqueIdController.dispose();
    nameController.dispose();
    dobController.dispose();
    genderController.dispose();
    districtController.dispose();
    upazillaController.dispose();
    relationshipController.dispose();
    participant1Controller.dispose();
    participant2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // const Text(
                  //   'ব্যক্তিগত তথ্য আপডেট',
                  //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  // ),
                  // const SizedBox(height: 10),
                  _buildInput('আইডি', uniqueIdController),
                  _buildInput('নাম', nameController),
                  _buildInput('জন্মসাল (দিন/মাস/বছর)', dobController),
                  _buildInput('জেন্ডার (পুরুষ/নারী/তৃতীয় লিঙ্গ)', genderController),
                  _buildInput('জেলা', districtController),
                  _buildInput('উপজেলা', upazillaController),
                  _buildParticipantType(),
                  _buildInput('পার্টিসিপেন্টের সাথে সম্পর্ক', relationshipController),
                  _buildInput('পার্টিসিপেন্ট ১', participant1Controller),
                  _buildInput('পার্টিসিপেন্ট ২', participant2Controller),
                  const SizedBox(height: 10),
                  nextButton(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget nextButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 20.0),
      height: DimenValuesUtil.buttonHeight,
      decoration: GradientButtonDecoration(),
      child: InkWell(
        onTap: update,
        child: const Center(
          child: Text(
            "আপডেট করুন",
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

  Future<void> update() async {
    if (_formKey.currentState!.validate()) {
      final uid = FirebaseAuth.instance.currentUser?.uid;

      if (uid == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User not logged in')),
        );
        return;
      }

      final data = {
        'unique_id': uniqueIdController.text.trim(),
        'name': nameController.text.trim(),
        'dob': dobController.text.trim(),
        'gender': genderController.text.trim(),
        'district': districtController.text.trim(),
        'upazilla': upazillaController.text.trim(),
        'participant_type': participantType,
        'relationship': relationshipController.text.trim(),
        'participant_1': participant1Controller.text.trim(),
        'participant_2': participant2Controller.text.trim(),
      };

      try {
        await FirebaseFirestore.instance.collection('personal_info').doc(uid).set(data);
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text('সফল'),
            content: Text('আপনার তথ্য সফলভাবে আপডেট হয়েছে।'),
          ),
        );

        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pop(); // Close the dialog
          Navigator.of(context).pop(); // Go back to previous screen
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving data: $e')),
        );
      }
    }
  }

  Widget _buildInput(String label, TextEditingController controller) {
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
        ),
        validator: (value) =>
        value == null || value.isEmpty ? 'Required' : null,
      ),
    );
  }

  Widget _buildParticipantType() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("পার্টিসিপেন্ট টাইপ:", style: TextStyle(color: Colors.black)),
              const SizedBox(width: 10),
              ChoiceChip(
                label: const Text('ভলান্টিয়ার'),
                padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                selected: participantType == 'volunteer',
                selectedColor: ColorUtil.mainColor,
                onSelected: (_) {
                  setState(() => participantType = 'volunteer');
                },
              ),
              const SizedBox(width: 10),
              ChoiceChip(
                label: const Text('পার্টিসিপেন্ট'),
                padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                selected: participantType == 'participant',
                selectedColor: ColorUtil.mainColor,
                onSelected: (_) {
                  setState(() => participantType = 'participant');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  _appbar() {
    return AppBar(
      title:  const Text(
        // getTranslated(context, "LEAVE_APPLY"),
        "প্রোফাইল আপডেট",
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
