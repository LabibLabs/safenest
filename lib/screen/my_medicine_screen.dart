import 'package:flutter/material.dart';
import 'package:safenest/screen/medicine.dart';
import 'package:safenest/screen/medicine_entry_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyMedicineScreen extends StatefulWidget {
  final String userPhone;

  const MyMedicineScreen({
    required this.userPhone,
    super.key,
  });

  @override
  State<MyMedicineScreen> createState() => _MyMedicineStateScreen();
}

class _MyMedicineStateScreen extends State<MyMedicineScreen> {

  Widget _medicineCard({
    required String? name,
    required String? strength,
    required double? quantity,
    required String? mealTiming,
    required int? reminderQuantity,
    required int index,
  }) {
    return GestureDetector(

      onLongPress: () {
        showDialog(
            context: context,
            builder: ((context) {
              return AlertDialog(
                title: Text(
                    "Delete medicine"
                ),
                content: Text(
                  "Are you sure you want to delete this medicine?",
                ),
                actions: [

                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                      )
                  ),

                  TextButton(
                      onPressed: () {
                        setState(() {
                          medicine.removeAt(index);
                          Navigator.pop(context);
                        });
                      },
                      child: Text(
                        "Delete",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      )
                  ),
                ],
              );
            }
            )
        );
      },

      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 5,
        ),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green[100],
                  ),
                  child: Image.asset(
                    "assets/images/medicine.png",
                    width: 50,
                    height: 50,
                  ),
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$name $strength",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        reminderQuantity == 0 ?
                        "Not daily " :
                        reminderQuantity == 1
                            ? "once daily "
                            : reminderQuantity == 2
                            ? "Twice daily "
                            : "Many time daily ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),

                      Icon(
                        Icons.circle,
                        size: 7,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),

                      Text(
                        " $mealTiming",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),

              Spacer(),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "$quantity",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: (quantity ?? 0) >= 15 ?
                      Colors.green :
                      (quantity ?? 0) >= 6 ?
                      Colors.orange :
                      Colors.red,
                    ),
                  ),

                  SizedBox(
                    height: 6,
                  ),

                  Text(
                    "tabs left",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  )
                ],
              ),

              SizedBox(
                width: 10,
              )
            ],
          ),
        ),
      ),
    );
  }


  // For Firestore medicines sorting
  Future<void> getMedicineData() async {

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userPhone)
        .collection('medicines')
        .orderBy('createdAt', descending: true)
        .get();

    medicine.clear();

    for (var doc in snapshot.docs) {
      medicine.add(
        Medicine(
          name: doc['name'],
          strength: doc['strength'],
          quantity: (doc['quantity'] as num?)?.toDouble(),
          dose: (doc['dose'] as num?)?.toDouble(),
          mealTiming: doc['mealTiming'],
          reminderTime: List<String>.from(doc['reminderTimes']),
        ),
      );
    }

    setState(() {});
  }


  @override
  void initState() {
    super.initState();

    getMedicineData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 52,
          ),

          Container(
            width: double.infinity,
            height: 150,
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 18),
            decoration: BoxDecoration(color: Colors.green),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 17),

                Text(
                  "My Medicine",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Text(
                      "${medicine.length} Medicines",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          Expanded(
              child: ListView.builder(
                  itemCount: medicine.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return _medicineCard(
                      name: medicine[index].name,
                      strength: medicine[index].strength,
                      quantity: medicine[index].quantity,
                      mealTiming: medicine[index].mealTiming,
                      reminderQuantity: medicine[index].reminderTime?.length ??
                          0,
                      index: index,
                    );
                  }
              )
          )
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {

          bool result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  MedicineEntryScreen(
                    userPhone: widget.userPhone,
                  ),
            ),
          );

          if (result == true) {
            await getMedicineData();
          }
        },

        backgroundColor: Colors.green,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),

        icon: Icon(
          Icons.add,
          size: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),

        label: Text(
          "Add Medicine",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

List<Medicine> medicine = [];