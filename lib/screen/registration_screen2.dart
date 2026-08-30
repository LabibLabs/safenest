import 'package:flutter/material.dart';


const Color kPrimaryGreen = Color(0xFF17A673);

class RegistrationPage2 extends StatefulWidget {
  const RegistrationPage2({super.key});

  @override
  State<RegistrationPage2> createState() => _RegistrationPage2State();
}

class _RegistrationPage2State extends State<RegistrationPage2> {

final TextEditingController _heightController = TextEditingController();
final TextEditingController _weightController = TextEditingController();
final TextEditingController _allergiesController = TextEditingController();
final TextEditingController _chronicConditionsController =
TextEditingController();


String? selectedBloodGroup;


String selectedLanguage = 'Bangla';

final List<String> _bloodGroups = [
'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'
];

@override
void dispose() {
_heightController.dispose();
_weightController.dispose();
_allergiesController.dispose();
_chronicConditionsController.dispose();
super.dispose();
}


void _onContinuePressed() {
String height = _heightController.text;
String weight = _weightController.text;
String bloodGroup = selectedBloodGroup ?? '';
String allergies = _allergiesController.text;
String chronicConditions = _chronicConditionsController.text;
String preferredLanguage = selectedLanguage;

debugPrint('Height: $height');
debugPrint('Weight: $weight');
debugPrint('Blood Group: $bloodGroup');
debugPrint('Allergies: $allergies');
debugPrint('Chronic Conditions: $chronicConditions');
debugPrint('Preferred Language: $preferredLanguage');


}

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.white,
body: SafeArea(
child: Column(
children: [

_buildHeader(),

Expanded(
child: SingleChildScrollView(
padding:
const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [

Row(
children: [
Expanded(
child: _labeledFilledField(
label: 'Height (cm)',
controller: _heightController,
hint: '165',
),
),
const SizedBox(width: 14),
Expanded(
child: _labeledFilledField(
label: 'Weight (kg)',
controller: _weightController,
hint: '70',
),
),
],
),

const SizedBox(height: 20),
const Text('Blood Group',
style: TextStyle(
fontWeight: FontWeight.w600, fontSize: 14)),
const SizedBox(height: 10),
_buildBloodGroupGrid(),

const SizedBox(height: 20),
_labeledOutlinedField(
label: 'Allergies',
controller: _allergiesController,
hint: 'e.g., Penicillin, Peanuts',
),