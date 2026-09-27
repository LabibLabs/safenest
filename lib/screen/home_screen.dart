import 'package:flutter/material.dart';
import 'package:safenest/screen/functions/get_age.dart';
import 'package:safenest/screen/functions/get_gender.dart';
import 'package:safenest/screen/functions/get_step_walk.dart';
import 'package:safenest/screen/functions/get_taken_medicine.dart';
import 'package:safenest/screen/functions/get_user_name.dart';
import 'package:safenest/screen/functions/get_water_galsses.dart';
import 'package:safenest/screen/functions/greeting.dart';
import 'package:safenest/screen/medicine_entry_screen.dart';
import 'package:safenest/screen/my_medicine_screen.dart';
class HomeScreen extends StatefulWidget
{
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState()=>_HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>
{

  Widget _medicineCard ({
    required String? name,
    required String? strength,
    required double? quantity,
    required String? mealTiming,
    required int? reminderQuantity,
    required int index,
  })
  {
    return GestureDetector(

      onLongPress: (){
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
                      onPressed:(){
                        Navigator.pop(context);
                      },
                      child:Text(
                        "Cancel",
                      )
                  ),

                  TextButton(
                      onPressed: (){
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
        padding:EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 5,
        ),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:EdgeInsets.all(10),
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
                        reminderQuantity==0?
                        "Not daily ":
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
                      color: (quantity ?? 0)>=15?
                      Colors.green:
                      (quantity ?? 0)>=6?
                      Colors.orange:
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

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Color(0xFFE4F2F5),
      //backgroundColor: Color(0xFFF7F9FA),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 40,
        ),
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/safenest_logo.png",
                width:70,
                height:70,
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Safe",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Nest",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Care ",
                        style: TextStyle(
                          fontSize:15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.black,
                        size: 6,
                        fontWeight: FontWeight.bold,
                      ),
                      Text(
                        " Health ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.black,
                        size: 6,
                        fontWeight: FontWeight.bold,
                      ),
                      Text(
                        " Safety",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                  onPressed:(){

                  },
                  icon: Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    size: 30,
                  )
              ),
              GestureDetector(
                onTap: (){
                  debugPrint("Profile button working successfully");
                },
                  child: getGender()?
                  (
                      getAge()?
                      Image.asset(
                        "assets/images/male_logo_1.png",
                        width: 50,
                      ):
                      Image.asset(
                        "assets/images/male_logo_2.png",
                        width: 50,
                      )
                  ):
                  (
                      getAge()?
                      Image.asset(
                        "assets/images/female_logo_1.png",
                        width: 50,
                      ):
                      Image.asset(
                        "assets/images/female_logo_2.png",
                        width: 50,
                      )
                  ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFEAF7F0),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 3,
                color: Color(0xFFD4EFE0),
              )
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getGreeting(),
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      getUserName(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.green[700],
                      ),
                    ),
                    Text(
                      "Taking care of your loved ones,\none day at a time.",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Expanded(
                    child:Image.asset(
                      "assets/images/home_screen_logo.png",
                    )
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              //1st show abr medicine taken today
              Expanded(
                flex: 1,
                  child:InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: (){
                      debugPrint("Medicines taken button work successfully");
                    },
                    child: Ink(
                      padding: EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 12,
                          )
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Spacer(),
                              Image.asset(
                                "assets/images/medicine_logo.png",
                                width: 50,
                                height: 50,
                              ),
                            ],
                          ),
                          Text(
                            getTakenMedicine(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Medicines\ntaken today",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ) ,
                    ),
                  )
              ),
              SizedBox(
                width: 13,
              ),
              //2nd show bar water glasses
              Expanded(
                  flex: 1,
                  child:InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: (){
                      debugPrint("Walter glasses button work successfully");
                    },
                    child: Ink(
                      padding: EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 12,
                          )
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Spacer(),
                              Image.asset(
                                "assets/images/water_logo.png",
                                width: 50,
                                height: 50,
                              ),
                            ],
                          ),
                          Text(
                            getWaterGlasses(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Water\nglasses",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ) ,
                    ),
                  ),
              ),
              SizedBox(
                width: 13,
              ),
              //show 3rd bar steps walled
              Expanded(
                  flex: 1,
                  child:InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: (){
                      debugPrint("Step button work successfully");
                    },
                    child: Ink(
                      padding: EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 12,
                          )
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Spacer(),
                              Image.asset(
                                "assets/images/step_logo.png",
                                width: 50,
                                height: 50,
                              ),
                            ],
                          ),
                          Text(
                            getStepWalk(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Steps\nWalked",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ) ,
                    ),
                  ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          //for quick action button
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //1st quick action button caregiver mode
              Expanded(
                flex: 1,
                  child:InkWell(
                    onTap: (){
                      debugPrint("Caregiver button works successfully");
                    },
                      borderRadius: BorderRadius.circular(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Ink(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child:Image.asset(
                            "assets/images/caregiver_logo.png",
                          ),
                        ),
                        Text(
                          "Caregiver\nMode",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        )
                      ],
                    )
                  )
              ),
              SizedBox(
                width: 14,
              ),
              //2nd quick action button doctor appointment
              Expanded(
                  flex: 1,
                  child:InkWell(
                      onTap: (){
                        debugPrint("doctor appointment button works successfully");
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Ink(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child:Image.asset(
                              "assets/images/doctor_appointment_logo.png",
                            ),
                          ),
                          Text(
                            "doctor\nappointment",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          )
                        ],
                      )
                  )
              ),
              SizedBox(
                width: 14,
              ),
              //3rd quick action button Add Medicine
              Expanded(
                  flex: 1,
                  child:InkWell(
                      onTap: () async{

                        bool result = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>MedicineEntryScreen())
                        );

                        if(result==true)
                          setState(() {

                          });
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Ink(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child:Image.asset(
                              "assets/images/add_medicine_logo.png",
                            ),
                          ),
                          Text(
                            "Add\nMedicine",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          )
                        ],
                      )
                  )
              ),
              SizedBox(
                width: 14,
              ),
              //4th quick action button Medicine Refill
              Expanded(
                  flex: 1,
                  child:InkWell(
                      onTap: (){
                        debugPrint("Medicine Refill button works successfully");
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Ink(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child:Image.asset(
                              "assets/images/medicine_refill_logo.png",
                            ),
                          ),
                          Text(
                            "Medicine\nRefill",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          )
                        ],
                      )
                  )
              ),
            ],
          ),
          ...List.generate(
            medicine.length>3?
            3:
            medicine.length,
            (index){
              return _medicineCard(
                name: medicine[index].name,
                strength: medicine[index].strength,
                quantity: medicine[index].quantity,
                mealTiming: medicine[index].mealTiming,
                reminderQuantity: medicine[index].reminderTime?.length ?? 0,
                index: index,
              );
            }

          )
        ],
      ),
    );
  }
}