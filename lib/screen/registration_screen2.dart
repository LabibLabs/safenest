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

const SizedBox(height: 20),
_labeledOutlinedField(
label: 'Chronic Conditions',
controller: _chronicConditionsController,
hint: 'e.g., Diabetes, Hypertension',
),

const SizedBox(height: 20),
const Text('Preferred Language',
style: TextStyle(
fontWeight: FontWeight.w600, fontSize: 14)),
const SizedBox(height: 10),
Row(
children: [
_buildLanguageButton('English'),
const SizedBox(width: 12),
_buildLanguageButton('Bangla'),
],
),
const SizedBox(height: 10),
],
),
),
),


Padding(
padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
child: Row(
children: [
Expanded(
child: OutlinedButton(
onPressed: () => Navigator.pop(context),
style: OutlinedButton.styleFrom(
padding: const EdgeInsets.symmetric(vertical: 16),
side: const BorderSide(color: Colors.grey),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(10),
),
),
child: const Text('Back',
style: TextStyle(color: Colors.black87)),
),
),
const SizedBox(width: 14),
Expanded(
child: ElevatedButton(
onPressed: _onContinuePressed,
style: ElevatedButton.styleFrom(
backgroundColor: kPrimaryGreen,
padding: const EdgeInsets.symmetric(vertical: 16),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(10),
),
),
child: const Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text('Continue',
style: TextStyle(
color: Colors.white,
fontWeight: FontWeight.w600)),
SizedBox(width: 6),
Icon(Icons.arrow_forward,
color: Colors.white, size: 18),
],
),
),
),
],
),
),
],
),
),
);
}

Widget _buildHeader() {
return Container(
width: double.infinity,
padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
decoration: const BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [Color(0xFF1FA774), Color(0xFF2E86DE)],
),
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text(
'Step 2 of 3',
style: TextStyle(color: Colors.white70, fontSize: 13),
),
const SizedBox(height: 6),
const Text(
'Medical Info',
style: TextStyle(
fontSize: 24,
fontWeight: FontWeight.bold,
color: Colors.white,
),
),
const SizedBox(height: 14),
_buildProgressBar(),
],
),
);
}


Widget _buildProgressBar() {
return Row(
children: [
Expanded(child: _progressSegment(true)),
const SizedBox(width: 6),
Expanded(child: _progressSegment(true)),
const SizedBox(width: 6),
Expanded(child: _progressSegment(false)),
],
);
}

Widget _progressSegment(bool active) {
return Container(
height: 5,
decoration: BoxDecoration(
color: active ? Colors.white : Colors.white.withOpacity(0.4),
borderRadius: BorderRadius.circular(3),
),
);
}

