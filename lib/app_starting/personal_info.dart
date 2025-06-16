import 'package:flutter/cupertino.dart';
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

  // Controllers
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
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 350,
          padding: EdgeInsets.all(20),
          // decoration: BoxDecoration(
          //   border: Border.all(color: Colors.deepPurple.shade200),
          //   borderRadius: BorderRadius.circular(12),
          // ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'ব্যক্তিগত তথ্য',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
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
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // if (_formKey.currentState!.validate()) {
                  //     // }
                  //     NavigationService.getCurrentState()
                  //         ?.pushReplacementNamed('/intro_page',);
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.deepPurpleAccent,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //   ),
                  //   child: const Text('Submit'),
                  // ),
                  nextButton(),
                  const SizedBox(
                    height: 20,
                  )
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
        onTap: () {
               NavigationService.getCurrentState()
                   ?.pushReplacementNamed('/intro_page',);
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
        validator: (value) => value == null || value.isEmpty ? 'Required' : null,
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
                label: Text('ভলান্টিয়ার'),
                padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                selected: participantType == 'volunteer',
                selectedColor: ColorUtil.mainColor,
                onSelected: (val) {
                  setState(() => participantType = 'volunteer');
                },
              ),
              const SizedBox(width: 10),
              ChoiceChip(
                label: Text('পার্টিসিপেন্ট'),
                padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                selected: participantType == 'participant',
                selectedColor: ColorUtil.mainColor,
                onSelected: (val) {
                  setState(() => participantType = 'participant');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
