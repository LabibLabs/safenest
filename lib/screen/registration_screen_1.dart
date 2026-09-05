import 'package:flutter/material.dart';
import 'package:safenest/screen/welcome_screen.dart';
import 'registration_screen_2.dart';

class RegistrationScreen1 extends StatefulWidget {
  const RegistrationScreen1({super.key});

  @override
  State<RegistrationScreen1> createState() => _Registration1State();
}

class _Registration1State extends State<RegistrationScreen1> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  String name = '';
  String dateOfBirth = '';
  String gender = '';
  String phoneNumber = '';
  String address = '';

  bool checkGender = true;

  Future<void> selectDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      String month = selectedDate.month.toString().padLeft(2, '0');
      String day = selectedDate.day.toString().padLeft(2, '0');
      String year = selectedDate.year.toString();

      setState(() {
        dateOfBirth = '$month/$day/$year';
        dobController.text = dateOfBirth;
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    dobController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),

            // Header Box (Gradient)
            Container(
              width: double.infinity,
              height: 125,
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.green,
                    Colors.blue,
                  ],
                  stops: [
                    0.3,
                    1,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 22,
                  ),
                  const Text(
                    "Step 1 of 3",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    "Personal Info",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                    ),
                  ),

                  // Progress bar row
                  Row(
                    children: [
                      // 1st bar (Active)
                      Container(
                        width: 55,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // 2nd bar (Inactive)
                      Container(
                        width: 55,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // 3rd bar (Inactive)
                      Container(
                        width: 40,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            // Form Content Area (Scrollable to prevent keyboard overflow)
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Full Name Title
                      Row(
                        children: const [
                          SizedBox(width: 25),
                          Text(
                            "Full Name *",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      // Full Name Input
                      Row(
                        children: [
                          const SizedBox(width: 25),
                          Expanded(
                            child: TextFormField(
                              controller: nameController,
                              validator: (value) => (value == null || value.isEmpty) ? "Enter your full name" : null,
                              decoration: InputDecoration(
                                hintText: "Enter your full name",
                                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 25),
                        ],
                      ),
                      const SizedBox(height: 15),

                      // Date of Birth Title
                      Row(
                        children: const [
                          SizedBox(width: 25),
                          Text(
                            "Date of Birth *",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      // Date of Birth Input
                      Row(
                        children: [
                          const SizedBox(width: 25),
                          Expanded(
                            child: TextFormField(
                              controller: dobController,
                              readOnly: true,
                              onTap: selectDate,
                              validator: (value) => (value == null || value.isEmpty) ? "Select date of birth" : null,
                              decoration: InputDecoration(
                                hintText: "MM/DD/YYYY",
                                suffixIcon: const Icon(Icons.calendar_today, color: Colors.grey, size: 20),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 25),
                        ],
                      ),
                      const SizedBox(height: 15),

                      // Gender Title & Error Text
                      Row(
                        children: [
                          const SizedBox(width: 25),
                          const Text(
                            "Gender *",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Select your Gender",
                              style: TextStyle(
                                color: checkGender ? Colors.white : Colors.red,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Gender Buttons
                      Row(
                        children: [
                          const SizedBox(width: 25),
                          Expanded(child: _buildGenderButton('Male')),
                          const SizedBox(width: 8),
                          Expanded(child: _buildGenderButton('Female')),
                          const SizedBox(width: 8),
                          Expanded(child: _buildGenderButton('Other')),
                          const SizedBox(width: 25),
                        ],
                      ),
                      const SizedBox(height: 15),

                      // Phone Number Title
                      Row(
                        children: const [
                          SizedBox(width: 25),
                          Text(
                            "Phone Number *",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      // Phone Number Input
                      Row(
                        children: [
                          const SizedBox(width: 25),
                          Expanded(
                            child: TextFormField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              validator: (value) => (value == null || value.isEmpty) ? "Enter your phone number" : null,
                              decoration: InputDecoration(
                                hintText: "01XXXXXXXXX",
                                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 25),
                        ],
                      ),
                      const SizedBox(height: 15),

                      // Address Title
                      Row(
                        children: const [
                          SizedBox(width: 25),
                          Text(
                            "Address (Optional)",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      // Address Input
                      Row(
                        children: [
                          const SizedBox(width: 25),
                          Expanded(
                            child: TextFormField(
                              controller: addressController,
                              decoration: InputDecoration(
                                hintText: "Enter your address",
                                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 25),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Navigation Buttons
            Row(
              children: [
                const SizedBox(width: 25),
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context,
                            MaterialPageRoute(builder: (context)=>WelcomeScreen()
                              ,)
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        minimumSize: const Size(double.infinity, 48),
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        "Back",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                ),
                const SizedBox(width: 15),
                Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (gender.isEmpty) {
                            checkGender = false;
                          } else {
                            checkGender = true;
                          }

                          if (formKey.currentState!.validate() && checkGender) {
                            name = nameController.text;
                            phoneNumber = phoneController.text;
                            address = addressController.text;
                            if(!context.mounted)return;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:(context)=>RegistrationScreen2(),
                                )
                            );
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        minimumSize: const Size(double.infinity, 48),
                        backgroundColor: Colors.green,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Continue",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 23,
                          )
                        ],
                      ),
                    )
                ),
                const SizedBox(width: 25),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Helper method for Gender Buttons matching the Blood Group style
  Widget _buildGenderButton(String type) {
    bool isSelected = gender == type;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (gender == type) {
            gender = ''; // Deselect if already selected
          } else {
            gender = type;
            checkGender = true; // Clear the error text if they pick one
          }
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.green : Colors.white,
        minimumSize: const Size(double.infinity, 48),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        type,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
