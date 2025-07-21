import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:monon/util/color_util.dart';

import '../Common/login_gradient_button_decoration.dart';
import '../route/navigation_service.dart';
import '../util/dimen_values_util.dart';

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({super.key});

  @override
  PersonalInfoFormState createState() => PersonalInfoFormState();
}

class PersonalInfoFormState extends State<PersonalInfoForm> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();
  final districtController = TextEditingController();
  final upazillaController = TextEditingController();
  final relationshipController = TextEditingController();
  final participant1Controller = TextEditingController();
  final participant2Controller = TextEditingController();

  String roleLabel = "ইউজার";
  String role = "volunteer";

  @override
  void initState() {
    super.initState();
    loadExistingData();
  }

  void loadExistingData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final data = doc.data();
    if (data != null) {
      nameController.text = data['name'] ?? '';
      dobController.text = data['dob'] ?? '';
      genderController.text = data['gender'] ?? '';
      districtController.text = data['district'] ?? '';
      upazillaController.text = data['upazilla'] ?? '';
      relationshipController.text = data['relationship'] ?? '';
      participant1Controller.text = data['participants']?['participant1']?['name'] ?? '';
      participant2Controller.text = data['participants']?['participant2']?['name'] ?? '';

      role = data['role'];
      if (role == 'admin') {
        roleLabel = 'এডমিন';
      } else if (role == 'volunteer') {
        roleLabel = 'ভলান্টিয়ার';
      } else if (role == 'participant') {
        roleLabel = 'পার্টিসিপেন্ট';
      }

      setState(() {});
    }
  }

  @override
  void dispose() {
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
                    'ব্যক্তিগত তথ্য',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildRoleBox(roleLabel),
                  _buildInput('নাম', nameController),
                  // _buildInput('জন্মসাল (দিন/মাস/বছর)', dobController),
                  _buildInput('জেন্ডার (পুরুষ/নারী/তৃতীয় লিঙ্গ)', genderController),
                  _buildInput('জেলা', districtController),
                  // _buildInput('উপজেলা', upazillaController),
                  if (role == 'volunteer') ...[
                    _buildInput('পার্টিসিপেন্টের সাথে সম্পর্ক', relationshipController),
                    _buildInput('পার্টিসিপেন্ট ১', participant1Controller),
                    _buildInput('পার্টিসিপেন্ট ২', participant2Controller),
                  ],

                  const SizedBox(height: 10),
                  nextButton(),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleBox(String label) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 10.0),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: ColorUtil.statusBar,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorUtil.mainColor, width: 2.0),
      ),
      child: Center(
        child: Text(
          "ইউজার টাইপ : $label",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
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

  update() async {
    if (_formKey.currentState!.validate()) {
      final uid = FirebaseAuth.instance.currentUser?.uid;

      if (uid == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User not logged in')),
        );
        return;
      }

      final Map<String, dynamic> updatedData = {
        'name': nameController.text.trim(),
        'dob': "nai",
        'gender': genderController.text.trim(),
        'district': districtController.text.trim(),
        'upazilla': "nai",
        'updatedAt': FieldValue.serverTimestamp(),
      };

      if (role == 'volunteer') {
        updatedData['relationship'] = relationshipController.text.trim();
        updatedData['participants'] = {
          'participant1': {
            'name': participant1Controller.text.trim(),
          },
          'participant2': {
            'name': participant2Controller.text.trim(),
          },
        };
      }

      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .set(updatedData, SetOptions(merge: true));

        NavigationService.getCurrentState()?.pushReplacementNamed('/intro_page', arguments: role);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving data: $e')),
        );
      }
    }
  }

  Widget _buildInput(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
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
        validator: (value) => value == null || value.isEmpty ? 'Required' : null,
      ),
    );
  }
}
