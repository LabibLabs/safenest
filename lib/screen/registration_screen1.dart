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


// TEXT CONTROLLERS
// ----------------------------------------------------------

  final TextEditingController nameController =
  TextEditingController();

  final TextEditingController dobController =
  TextEditingController();

  final TextEditingController phoneController =
  TextEditingController();

  final TextEditingController addressController =
  TextEditingController();



// USER DATA VARIABLES
// These variables store the user's input
// ----------------------------------------------------------

  String name = '';
  String dateOfBirth = '';
  String gender = '';
  String phoneNumber = '';
  String address = '';

// Selected gender
  String selectedGender = '';


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
      String month =
      pickedDate.month.toString().padLeft(2, '0');

      String day =
      pickedDate.day.toString().padLeft(2, '0');

      String year =
      pickedDate.year.toString();

      setState(() {
        dobController.text =
        '$month/$day/$year';
      });
    }
  }



// GENDER BUTTON
// ----------------------------------------------------------

  Widget genderButton(String gender) {
    bool isSelected =
        selectedGender == gender;

    return Expanded(
      child: GestureDetector(

        onTap: () {
          setState(() {
            selectedGender = gender;
          });
        },

        child: Container(

          height: 52,

          margin:
          const EdgeInsets.symmetric(
            horizontal: 4,
          ),

          decoration: BoxDecoration(

            color: isSelected
                ? const Color(0xFFE8F5E9)
                : const Color(0xFFF7F7F7),

            borderRadius:
            BorderRadius.circular(12),

            border: Border.all(

              color: isSelected
                  ? const Color(0xFF2E9E44)
                  : const Color(0xFFD0D0D0),

              width:
              isSelected ? 2 : 1,
            ),
          ),

          child: Center(

            child: Text(

              gender,

              style: TextStyle(

                fontSize: 14,

                fontWeight:
                isSelected
                    ? FontWeight.w600
                    : FontWeight.w400,

                color: Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }



// TEXT FIELD
// ----------------------------------------------------------

  Widget inputField({
    required String label,
    required String hint,
    required TextEditingController controller,

    bool requiredField = true,

    Widget? suffixIcon,

    TextInputType? keyboardType,

    VoidCallback? onTap,
  }) {
    return Column(

      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        RichText(

          text: TextSpan(

            text: label,

            style: const TextStyle(

              color: Colors.black87,

              fontSize: 13,

              fontWeight:
              FontWeight.w600,
            ),

            children: [

              if (requiredField)

                const TextSpan(

                  text: ' *',

                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
            ],
          ),
        ),


        const SizedBox(height: 7),


        TextFormField(

          controller: controller,

          keyboardType: keyboardType,

          readOnly:
          onTap != null,

          onTap: onTap,


          style: const TextStyle(

            fontSize: 14,

            color: Colors.black87,
          ),


          decoration:
          InputDecoration(

            hintText: hint,

            hintStyle:
            const TextStyle(

              color:
              Color(0xFF888888),

              fontSize: 14,
            ),


            filled: true,

            fillColor:
            const Color(0xFFF1F1F1),


            suffixIcon:
            suffixIcon,


            contentPadding:
            const EdgeInsets.symmetric(

              horizontal: 16,

              vertical: 16,
            ),


            border:
            OutlineInputBorder(

              borderRadius:
              BorderRadius.circular(12),

              borderSide:
              BorderSide.none,
            ),


            enabledBorder:
            OutlineInputBorder(

              borderRadius:
              BorderRadius.circular(12),

              borderSide:
              BorderSide.none,
            ),


            focusedBorder:
            OutlineInputBorder(

              borderRadius:
              BorderRadius.circular(12),

              borderSide:
              const BorderSide(

                color:
                Color(0xFF2E9E44),

                width: 1.5,
              ),
            ),


            errorBorder:
            OutlineInputBorder(

              borderRadius:
              BorderRadius.circular(12),

              borderSide:
              const BorderSide(

                color: Colors.red,
              ),
            ),


            focusedErrorBorder:
            OutlineInputBorder(

              borderRadius:
              BorderRadius.circular(12),

              borderSide:
              const BorderSide(

                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }



// CONTINUE BUTTON
// ----------------------------------------------------------



  void continueButton() {
    name =
        nameController.text.trim();

    dateOfBirth =
        dobController.text.trim();

    gender =
        selectedGender;

    phoneNumber =
        phoneController.text.trim();

    address =
        addressController.text.trim();


    ScaffoldMessenger.of(context)
        .showSnackBar(

      const SnackBar(

        content:
        Text('Step 1 completed!'),
      ),
    );
  }



// MAIN UI
// ----------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor:
      const Color(0xFFF9F9F9),


      body: SafeArea(

        child: LayoutBuilder(

          builder:
              (context, constraints) {
            return SingleChildScrollView(

              physics:
              const BouncingScrollPhysics(),


              child: ConstrainedBox(

                constraints:
                BoxConstraints(

                  minHeight:
                  constraints.maxHeight,
                ),


                child: Column(

                  children: [


// TOP HEADER
// --------------------------------------------------

                    Container(

                      width:
                      double.infinity,


                      padding:
                      const EdgeInsets.fromLTRB(

                        20,
                        25,
                        20,
                        20,
                      ),


                      decoration:
                      const BoxDecoration(

                        gradient:
                        LinearGradient(

                          colors: [

                            Color(0xFF38A852),

                            Color(0xFF2096D2),
                          ],

                          begin:
                          Alignment.centerLeft,

                          end:
                          Alignment.centerRight,
                        ),
                      ),


                      child: Column(

                        crossAxisAlignment:
                        CrossAxisAlignment.start,


                        children: [

                          const Text(

                            'Step 1 of 3',

                            style:
                            TextStyle(

                              color:
                              Colors.white70,

                              fontSize: 12,

                              fontWeight:
                              FontWeight.w400,
                            ),
                          ),


                          const SizedBox(
                            height: 5,
                          ),


                          const Text(

                            'Personal Info',

                            style:
                            TextStyle(

                              color:
                              Colors.white,

                              fontSize: 21,

                              fontWeight:
                              FontWeight.w600,
                            ),
                          ),


                          const SizedBox(
                            height: 12,
                          ),


// Progress line

                          Container(

                            width: 55,

                            height: 3,


                            decoration:
                            BoxDecoration(

                              color:
                              Colors.white,

                              borderRadius:
                              BorderRadius.circular(
                                10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),



// FORM
// --------------------------------------------------

                    Padding(

                      padding:
                      const EdgeInsets.fromLTRB(

                        20,
                        18,
                        20,
                        20,
                      ),


                      child: Column(

                        crossAxisAlignment:
                        CrossAxisAlignment.start,


                        children: [


// FULL NAME
// ------------------------------------------------

                          inputField(

                            label:
                            'Full Name',

                            hint:
                            'Enter your full name',

                            controller:
                            nameController,
                          ),


                          const SizedBox(
                            height: 18,
                          ),



// DATE OF BIRTH
// ------------------------------------------------

                          inputField(

                            label:
                            'Date of Birth',

                            hint:
                            'mm/dd/yyyy',

                            controller:
                            dobController,


                            suffixIcon:
                            const Icon(

                              Icons
                                  .calendar_month_outlined,

                              size: 20,

                              color:
                              Colors.black87,
                            ),


                            onTap:
                            selectDate,
                          ),


                          const SizedBox(
                            height: 18,
                          ),



// GENDER
// ------------------------------------------------

                          RichText(

                            text:
                            const TextSpan(

                              text:
                              'Gender',

                              style:
                              TextStyle(

                                color:
                                Colors.black87,

                                fontSize: 13,

                                fontWeight:
                                FontWeight.w600,
                              ),

                              children: [

                                TextSpan(
                                  text: ' *',
                                ),
                              ],
                            ),
                          ),


                          const SizedBox(
                            height: 7,
                          ),


                          Row(

                            children: [

                              genderButton(
                                'Male',
                              ),

                              genderButton(
                                'Female',
                              ),

                              genderButton(
                                'Other',
                              ),
                            ],
                          ),


                          const SizedBox(
                            height: 18,
                          ),



// PHONE NUMBER
// ------------------------------------------------

                          inputField(

                            label:
                            'Phone Number',

                            hint:
                            '01XXXXXXXXX',

                            controller:
                            phoneController,

                            keyboardType:
                            TextInputType.phone,
                          ),


                          const SizedBox(
                            height: 18,
                          ),



// ADDRESS
// ------------------------------------------------

                          inputField(

                            label:
                            'Address (Optional)',

                            hint:
                            'Your home address',

                            controller:
                            addressController,

                            requiredField:
                            false,

                            keyboardType:
                            TextInputType
                                .streetAddress,
                          ),


                          const SizedBox(
                            height: 28,
                          ),



// CONTINUE BUTTON
// ------------------------------------------------

                          SizedBox(

                            width:
                            double.infinity,

                            height: 54,


                            child:
                            ElevatedButton(

                              onPressed:
                              continueButton,


                              style:
                              ElevatedButton.styleFrom(

                                backgroundColor:
                                const Color(
                                  0xFF29963E,
                                ),

                                foregroundColor:
                                Colors.white,

                                elevation: 0,


                                shape:
                                RoundedRectangleBorder(

                                  borderRadius:
                                  BorderRadius.circular(
                                    12,
                                  ),
                                ),
                              ),


                              child:
                              const Text(

                                'Continue →',

                                style:
                                TextStyle(

                                  fontSize: 15,

                                  fontWeight:
                                  FontWeight.w600,
                                ),
                              ),
                            ),
                          ),


                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  // DISPOSE CONTROLLERS
  // ----------------------------------------------------------

  @override
  void dispose() {
    nameController.dispose();
    dobController.dispose();
    phoneController.dispose();
    addressController.dispose();

    super.dispose();
  }
}




