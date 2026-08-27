import 'package:flutter/material.dart';

void main() {
  runApp(const SafeNestApp());
}

class SafeNestApp extends StatelessWidget {
  const SafeNestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SafeNest',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E9E44),
        ),
      ),
      home: const RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
final _formKey = GlobalKey<FormState>();

// Text controllers
final TextEditingController nameController = TextEditingController();
final TextEditingController dobController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController addressController = TextEditingController();

// Selected gender
String selectedGender = '';

// ----------------------------------------------------------
// DATA VARIABLES FOR BACKEND
// ----------------------------------------------------------

String name = '';
String gender = '';
String phoneNumber = '';
String dateOfBirth = '';
String address = '';

// ----------------------------------------------------------
// DATE PICKER
// ----------------------------------------------------------

Future<void> selectDate() async {
DateTime? pickedDate = await showDatePicker(
context: context,
initialDate: DateTime(2000),
firstDate: DateTime(1900),
lastDate: DateTime.now(),
helpText: 'SELECT DATE OF BIRTH',
);

if (pickedDate != null) {
String month = pickedDate.month.toString().padLeft(2, '0');
String day = pickedDate.day.toString().padLeft(2, '0');
String year = pickedDate.year.toString();

setState(() {
dobController.text = '$month/$day/$year';
});
}
}

// ----------------------------------------------------------
// GENDER BUTTON
// ----------------------------------------------------------

Widget genderButton(String gender) {
bool isSelected = selectedGender == gender;

return Expanded(
child: GestureDetector(
onTap: () {
setState(() {
selectedGender = gender;
});
},
child: Container(
height: 52,
margin: const EdgeInsets.symmetric(horizontal: 4),
decoration: BoxDecoration(
color: isSelected
? const Color(0xFFE8F5E9)
: const Color(0xFFF7F7F7),
borderRadius: BorderRadius.circular(12),
border: Border.all(
color: isSelected
? const Color(0xFF2E9E44)
: const Color(0xFFD0D0D0),
width: isSelected ? 2 : 1,
),
),
child: Center(
child: Text(
gender,
style: TextStyle(
fontSize: 14,
fontWeight:
isSelected ? FontWeight.w600 : FontWeight.w400,
color: Colors.black87,
),
),
),
),
),
);
}