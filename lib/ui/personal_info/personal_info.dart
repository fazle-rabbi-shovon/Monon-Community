import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalInfoForm extends StatefulWidget {
  @override
  _PersonalInfoFormState createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final uniqueIdController = TextEditingController();
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();
  final districtController = TextEditingController(text: 'Satkhira');
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
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepPurple.shade200),
            borderRadius: BorderRadius.circular(12),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Personal Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _buildInput('Unique ID', uniqueIdController),
                  _buildInput('Name', nameController),
                  _buildInput('Date of Birth (dd/mm/yyyy)', dobController),
                  _buildInput('Gender (male/female/3rd gndr)', genderController),
                  _buildInput('District', districtController),
                  _buildInput('Upazilla', upazillaController),
                  _buildParticipantType(),
                  _buildInput('Relationship with local participants', relationshipController),
                  _buildInput('Participant 1', participant1Controller),
                  _buildInput('Participant 2', participant2Controller),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // For now: print the values
                        print("Unique ID: ${uniqueIdController.text}");
                        print("Name: ${nameController.text}");
                        print("DOB: ${dobController.text}");
                        print("Gender: ${genderController.text}");
                        print("District: ${districtController.text}");
                        print("Upazilla: ${upazillaController.text}");
                        print("Participant Type: $participantType");
                        print("Relationship: ${relationshipController.text}");
                        print("Participant 1: ${participant1Controller.text}");
                        print("Participant 2: ${participant2Controller.text}");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Submit'),
                  ),
                ],
              ),
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
          labelStyle: TextStyle(color: Colors.deepPurple),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple, width: 2),
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
        children: [
          Text("Participant Type:", style: TextStyle(color: Colors.deepPurple)),
          const SizedBox(width: 10),
          ChoiceChip(
            label: Text('volunteer'),
            selected: participantType == 'volunteer',
            selectedColor: Colors.deepPurpleAccent,
            onSelected: (val) {
              setState(() => participantType = 'volunteer');
            },
          ),
          const SizedBox(width: 10),
          ChoiceChip(
            label: Text('participant'),
            selected: participantType == 'participant',
            selectedColor: Colors.deepPurpleAccent,
            onSelected: (val) {
              setState(() => participantType = 'participant');
            },
          ),
        ],
      ),
    );
  }
}
