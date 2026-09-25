import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safenest/screen/otp_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationScreen3 extends StatefulWidget {
  final String? userPhone;

  const RegistrationScreen3({
    required this.userPhone,
    super.key,
  });

  @override
  State<RegistrationScreen3> createState() => _RegistrationScreen3State();
}

class _RegistrationScreen3State extends State<RegistrationScreen3> {
  final TextEditingController _contactNameController =
  TextEditingController();

  final TextEditingController _relationshipController =
  TextEditingController();

  final TextEditingController _phoneNumberController =
  TextEditingController();

  @override
  void dispose() {
    _contactNameController.dispose();
    _relationshipController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

// Add emergency contact details. Creating a new method
  Future<void> saveEmergencyContact(String contactName,
      String relationship,
      String emergencyPhone,
      String? phone,) async {
    await FirebaseFirestore.instance.collection('users').add({
      'contactName': contactName,
      'relationship': relationship,
      'emergencyPhone': emergencyPhone,
      'phone': phone,
      'createdAt': FieldValue.serverTimestamp(),
    });
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

            _buildHeader(),

            const SizedBox(
              height: 15,
            ),

            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 13,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFEFF7F2),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Text(
                          'This person will be called in case of emergency or SOS. You can add more contacts later.',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    _labeledOutlinedField(
                      label: 'Contact Name',
                      controller: _contactNameController,
                      hint: 'e.g. Priya Kumar',
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    _labeledOutlinedField(
                      label: 'Relationship',
                      controller: _relationshipController,
                      hint: 'e.g. Daughter, Son, Spouse',
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    _labeledOutlinedField(
                      label: 'Phone Number',
                      controller: _phoneNumberController,
                      hint: '01xxxxxxxxx',
                      keyboardType: TextInputType.phone,
                    ),

                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),

            Row(
              children: [
                SizedBox(
                  width: 25,
                ),

                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      minimumSize: Size(
                        double.infinity,
                        48,
                      ),
                    ),
                    child: Text(
                      "Back",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  width: 15,
                ),

                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () async {
                      String contactName =
                          _contactNameController.text;

                      String relationship =
                          _relationshipController.text;

                      String emergencyPhone =
                          _phoneNumberController.text;

                      await saveEmergencyContact(
                        contactName,
                        relationship,
                        emergencyPhone,
                        widget.userPhone,
                      );

                      if (!context.mounted) return;

                      await FirebaseAuth.instance.verifyPhoneNumber(
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},

                        verificationFailed:
                            (FirebaseAuthException error) {
                          print("OTP ERROR: ${error.code}");
                          print("OTP MESSAGE: ${error.message}");
                        },

                        codeSent: (String verificationId,
                            int? forceResendingToken,) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  OTPScreen(
                                    phone: widget.userPhone,
                                    verificationId: verificationId,
                                  ),
                            ),
                          );
                        },

                        codeAutoRetrievalTimeout:
                            (String verificationId) {},

                        phoneNumber: widget.userPhone!,
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      minimumSize: Size(
                        double.infinity,
                        48,
                      ),
                      backgroundColor: Colors.green,
                    ),

                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Text(
                          "Send OTP",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(
                          width: 8,
                        ),

                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 23,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 25,
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 125,
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.green,
            Colors.blue,
          ],
          stops: [
            0.3,
            1.0,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 22,
          ),

          Text(
            "Step 3 of 3",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),

          const Text(
            "Emergency Contact",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 27,
            ),
          ),

          Row(
            children: [
              Container(
                width: 55,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              const SizedBox(
                width: 8,
              ),

              Container(
                width: 55,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              const SizedBox(
                width: 8,
              ),

              Container(
                width: 55,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _labeledOutlinedField({
    required String label,
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),

        SizedBox(
          height: 7,
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hint,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 13,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

