import 'package:flutter/material.dart';
import 'package:safenest/screen/my_medicine_screen.dart';
import 'package:safenest/screen/medicine.dart';

class MedicineEntryScreen extends StatefulWidget {
  const MedicineEntryScreen({super.key});

  @override
  State<MedicineEntryScreen> createState() => _MedicineEntryScreenState();
}

class _MedicineEntryScreenState extends State<MedicineEntryScreen> {
  TextEditingController medicineName = new TextEditingController();
  TextEditingController medicineStrength = new TextEditingController();
  TextEditingController medicineQuantity = new TextEditingController();

  List<TextEditingController> reminderTimeController = [
    TextEditingController(),
  ];

  bool dose1 = false;
  bool dose2 = false;
  bool dose3 = false;
  bool dose4 = false;
  double? doseValue;

  bool mealTime1 = false;
  bool mealTime2 = false;
  bool mealTime3 = false;
  bool mealTime4 = false;
  String? mealTimeValue;

  void addController() {
    reminderTimeController.add(TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  padding: EdgeInsets.symmetric(horizontal: 17, vertical: 18),
                  decoration: BoxDecoration(color: Colors.green),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              size: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            Text(
                              "Back",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 7),
                      Text(
                        "Medicine Entry",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Fill in medicine details",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 17, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _inputTextField(
                        hint: "e.g. Napa",
                        label: "Medicine Name",
                        controller: medicineName,
                      ),
                      SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: _inputTextField(
                              hint: "500mg",
                              label: "Strength",
                              controller: medicineStrength,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            flex: 1,
                            child: _inputTextField(
                              hint: "30",
                              label: "Tablet Quantity",
                              controller: medicineQuantity,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                      Text(
                        "Does per intake",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 50,
                              child: _inputButton(
                                child: "½",
                                button: dose1,
                                onPressed: () {
                                  setState(() {
                                    if (!dose1) {
                                      dose1 = true;
                                      dose4 = false;
                                      dose2 = false;
                                      dose3 = false;
                                      doseValue = .5;
                                    } else {
                                      dose1 = false;
                                      doseValue = 0;
                                    }
                                  });
                                },
                                size: 20,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 50,
                              child: _inputButton(
                                child: "1",
                                button: dose2,
                                onPressed: () {
                                  setState(() {
                                    if (!dose2) {
                                      dose2 = true;
                                      dose1 = false;
                                      dose4 = false;
                                      dose3 = false;
                                      doseValue = 1;
                                    } else {
                                      dose2 = false;
                                      doseValue = 0;
                                    }
                                  });
                                },
                                size: 20,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 50,
                              child: _inputButton(
                                child: "1½",
                                button: dose3,
                                onPressed: () {
                                  setState(() {
                                    if (!dose3) {
                                      dose3 = true;
                                      dose1 = false;
                                      dose2 = false;
                                      dose4 = false;
                                      doseValue = 1.5;
                                    } else {
                                      dose3 = false;
                                      doseValue = 0;
                                    }
                                  });
                                },
                                size: 20,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 50,
                              child: _inputButton(
                                child: "2",
                                button: dose4,
                                onPressed: () {
                                  setState(() {
                                    if (!dose4) {
                                      dose4 = true;
                                      dose1 = false;
                                      dose2 = false;
                                      dose3 = false;
                                      doseValue = 2;
                                    } else {
                                      dose4 = false;
                                      doseValue = 0;
                                    }
                                  });
                                },
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                      Text(
                        "Meal Timing",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),

                      SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 50,
                              child: _inputButton(
                                child: "Before",
                                button: mealTime1,
                                onPressed: () {
                                  setState(() {
                                    if (!mealTime1) {
                                      mealTime1 = true;
                                      mealTime4 = false;
                                      mealTime2 = false;
                                      mealTime3 = false;
                                      mealTimeValue = "Before";
                                    } else {
                                      mealTime1 = false;
                                      mealTimeValue = "";
                                    }
                                  });
                                },
                                size: 14,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 50,
                              child: _inputButton(
                                child: "After",
                                button: mealTime2,
                                onPressed: () {
                                  setState(() {
                                    if (!mealTime2) {
                                      mealTime2 = true;
                                      mealTime1 = false;
                                      mealTime4 = false;
                                      mealTime3 = false;
                                      mealTimeValue = "After";
                                    } else {
                                      mealTime2 = false;
                                      mealTimeValue = "";
                                    }
                                  });
                                },
                                size: 15,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 50,
                              child: _inputButton(
                                child: "With",
                                button: mealTime3,
                                onPressed: () {
                                  setState(() {
                                    if (!mealTime3) {
                                      mealTime3 = true;
                                      mealTime1 = false;
                                      mealTime2 = false;
                                      mealTime4 = false;
                                      mealTimeValue = "With";
                                    } else {
                                      mealTime3 = false;
                                      mealTimeValue = "";
                                    }
                                  });
                                },
                                size: 15,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 50,
                              child: _inputButton(
                                child: "Any",
                                button: mealTime4,
                                onPressed: () {
                                  setState(() {
                                    if (!mealTime4) {
                                      mealTime4 = true;
                                      mealTime1 = false;
                                      mealTime2 = false;
                                      mealTime3 = false;
                                      mealTimeValue = "Any";
                                    } else {
                                      mealTime4 = false;
                                      mealTimeValue = "";
                                    }
                                  });
                                },
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 18),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Reminder Times in 24 format",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                addController();
                              });
                            },
                            child: Text(
                              "+ Add Time",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Column(
                        children: List.generate(
                          reminderTimeController.length,
                              (index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: _inputTextField(
                                hint: "8:00",
                                label: "Reminder ${index + 1}",
                                controller: reminderTimeController[index],
                                icon: reminderTimeController.length > 1
                                    ? IconButton(
                                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                                  onPressed: () {
                                    setState(() {
                                      reminderTimeController[index].dispose();
                                      reminderTimeController.removeAt(index);
                                    });
                                  },
                                )
                                    : const Icon(Icons.access_time_filled),
                              ),
                            );
                          },
                        ),
                      ),

                     SizedBox(
                       height: 18,
                     ),

                     SizedBox(
                       width: double.infinity,
                        height: 56,
                      child: ElevatedButton(onPressed: (){
                        medicine.add(Medicine(
                          name: medicineName.text,
                          strength: medicineStrength.text,
                          quantity: double.tryParse(medicineQuantity.text),
                          dose: doseValue,
                          mealTiming: mealTimeValue,
                          reminderTime: reminderTimeController
                              .map((controller) => controller.text)
                              .toList(),
                        ),
                        );

                        Navigator.pop(
                          context,
                          true,
                        );
                      },

                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )
                        ),

                        child: Text(
                          "Save Medicine",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ),
                    )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _inputTextField({
  required String hint,
  required String label,
  required TextEditingController controller,
  Widget? icon,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
        )
      ),
      SizedBox(height: 7),
      TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: icon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13)
          ),
          filled: true,
          fillColor: Colors.green[50],
        ),
      ),
    ],
  );
}

//button function
Widget _inputButton({
  required String child,
  required bool button,
  required VoidCallback onPressed,
  required double size,
}) {
  return ElevatedButton(
    onPressed: onPressed,

    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      backgroundColor: button ? Colors.green[50] : Colors.white,
    ),

    child: Text(
      child,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: button ? Colors.green : Colors.black,
      ),
    ),
  );
}



