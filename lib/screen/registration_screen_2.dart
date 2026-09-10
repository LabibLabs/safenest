//this code is written by human
import 'package:flutter/material.dart';
import 'package:safenest/screen/registration_screen_3.dart';
class RegistrationScreen2 extends StatefulWidget
{
  final String? phone;
  const RegistrationScreen2({
    required this.phone,
    super.key,
  });

  @override
  State<RegistrationScreen2> createState()=>_RegistrationScreen2State();
}
class _RegistrationScreen2State extends State<RegistrationScreen2>
{

  final formKey=GlobalKey<FormState>();
  final heightController=TextEditingController();
  final weightController=TextEditingController();
  final allergiesController=TextEditingController();
  final chronicConditionsController=TextEditingController();

  String ?bloodGroup;
  String ?height;
  String ?weight;
  String ?allergies;
  String ?chronicConditions;
  bool checkBloodGroup=true;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      //full screen container
      body: Container(
          width: double.infinity,
          height: double.infinity,

          //full screen column
          child: Column(

            children: [
              SizedBox(
                height: 50,
              ),

              //container for 1st box
              Container(
                width: double.infinity,
                height: 125,
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors:[
                        Colors.green,
                        Colors.blue,
                      ],
                      stops: [
                        0.3,
                        1,
                      ]
                  ),
                ),

                //1st box column
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 22,
                    ),

                    // 1st box step count
                    Text(
                      "Step 2 of 3",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    // title
                    Text(
                      "Medical Info",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                      ),
                    ),

                    //step bar row
                    Row(
                      children: [

                        //1st registration page bar
                        Container(
                          width: 55,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),

                        SizedBox(
                          width: 8,
                        ),

                        //2nd registration page bar
                        Container(
                          width: 55,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),

                        SizedBox(
                          width: 8,
                        ),

                        //3rd registration page bar
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

              SizedBox(
                height: 15,
              ),

              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    //height and weight title row
                    Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),

                        Expanded(
                          flex: 1,
                          child: Text(
                            "Height (cm) *",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 15,
                        ),

                        Expanded(
                          flex: 1,
                          child: Text(
                            "Weight (kg) *",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 25,
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 7,
                    ),

                    //height and weight input row
                    Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),

                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            validator: (value){
                              if(value==null||value.isEmpty)
                              {
                                return "Enter your Height";
                              }
                              return null;
                            },

                            keyboardType: TextInputType.number,
                            controller: heightController,
                            decoration: InputDecoration(
                              hintText: "165",
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

                        SizedBox(
                          width: 15,
                        ),

                        Expanded(
                          flex:1,
                          child: TextFormField(
                            validator: (value){
                              if(value==null||value.isEmpty)
                              {
                                return "Enter your Height";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            controller: weightController,
                            decoration: InputDecoration(
                              hintText: "70",
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

                        SizedBox(
                          width: 25,
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    //blood group title row
                    Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),

                        Text(
                          "Blood Group *",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),

                        Icon(
                          Icons.bloodtype,
                          color: Colors.red,
                          size: 24,
                        ),

                        SizedBox(
                          width: 10,
                        ),

                        Expanded(
                          child: Text(
                            "Enter your Blood Group",
                            style: TextStyle(
                              color: checkBloodGroup
                                  ? Colors.white
                                  : Colors.red,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    //blood group buttons
                    Row(
                      children: [

                        SizedBox(
                          width: 25,
                        ),

                        //1st blood group button
                        Expanded(
                          child: ElevatedButton(
                            onPressed:(){
                              setState(() {
                                if(bloodGroup==null||!(bloodGroup=="A+"))
                                {
                                  bloodGroup="A+";
                                }
                                else
                                {
                                  bloodGroup=null;
                                }
                              });
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              (!(bloodGroup==null)&&bloodGroup=="A+")
                                  ? Colors.green
                                  : Colors.white,

                              minimumSize: Size(
                                double.infinity,
                                48,
                              ),

                              elevation: 1,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),

                            child: Text(
                              "A+",
                              style: TextStyle(
                                color:
                                (!(bloodGroup==null)&&bloodGroup=="A+")
                                    ? Colors.white
                                    : Colors.green,

                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 8,
                        ),

                        //2nd blood group button
                        Expanded(
                          child: ElevatedButton(
                            onPressed:(){
                              setState(() {
                                if(bloodGroup==null||!(bloodGroup=="A-"))
                                {
                                  bloodGroup="A-";
                                }
                                else
                                {
                                  bloodGroup=null;
                                }
                              });
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              (!(bloodGroup==null)&&bloodGroup=="A-")
                                  ? Colors.green
                                  : Colors.white,

                              minimumSize: Size(
                                double.infinity,
                                48,
                              ),

                              elevation: 1,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),

                            child: Text(
                              "A-",
                              style: TextStyle(
                                color:
                                (!(bloodGroup==null)&&bloodGroup=="A-")
                                    ? Colors.white
                                    : Colors.green,

                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 8,
                        ),

                        //3rd blood group button
                        Expanded(
                          child: ElevatedButton(
                            onPressed:(){
                              setState(() {
                                if(bloodGroup==null||!(bloodGroup=="B+"))
                                {
                                  bloodGroup="B+";
                                }
                                else
                                {
                                  bloodGroup=null;
                                }
                              });
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              (!(bloodGroup==null)&&bloodGroup=="B+")
                                  ? Colors.green
                                  : Colors.white,

                              minimumSize: Size(
                                double.infinity,
                                48,
                              ),

                              elevation: 1,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),

                            child: Text(
                              "B+",
                              style: TextStyle(
                                color:
                                (!(bloodGroup==null)&&bloodGroup=="B+")
                                    ? Colors.white
                                    : Colors.green,

                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 8,
                        ),

                        //4th blood group button
                        Expanded(
                          child: ElevatedButton(
                            onPressed:(){
                              setState(() {
                                if(bloodGroup==null||!(bloodGroup=="B-"))
                                {
                                  bloodGroup="B-";
                                }
                                else
                                {
                                  bloodGroup=null;
                                }
                              });
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              (!(bloodGroup==null)&&bloodGroup=="B-")
                                  ? Colors.green
                                  : Colors.white,

                              minimumSize: Size(
                                double.infinity,
                                48,
                              ),

                              elevation: 1,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),

                            child: Text(
                              "B-",
                              style: TextStyle(
                                color:
                                (!(bloodGroup==null)&&bloodGroup=="B-")
                                    ? Colors.white
                                    : Colors.green,

                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 25,
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Row(
                      children: [

                        SizedBox(
                          width: 25,
                        ),

                        //5th blood group button
                        Expanded(
                          child: ElevatedButton(
                            onPressed:(){
                              setState(() {
                                if(bloodGroup==null||!(bloodGroup=="AB+"))
                                {
                                  bloodGroup="AB+";
                                }
                                else
                                {
                                  bloodGroup=null;
                                }
                              });
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              (!(bloodGroup==null)&&bloodGroup=="AB+")
                                  ? Colors.green
                                  : Colors.white,

                              minimumSize: Size(
                                double.infinity,
                                48,
                              ),

                              elevation: 1,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),

                            child: Text(
                              "AB+",
                              style: TextStyle(
                                color:
                                (!(bloodGroup==null)&&bloodGroup=="AB+")
                                    ? Colors.white
                                    : Colors.green,

                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 8,
                        ),

                        //6th blood group button
                        Expanded(
                          child: ElevatedButton(
                            onPressed:(){
                              setState(() {
                                if(bloodGroup==null||!(bloodGroup=="AB-"))
                                {
                                  bloodGroup="AB-";
                                }
                                else
                                {
                                  bloodGroup=null;
                                }
                              });
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              (!(bloodGroup==null)&&bloodGroup=="AB-")
                                  ? Colors.green
                                  : Colors.white,

                              minimumSize: Size(
                                double.infinity,
                                48,
                              ),

                              elevation: 1,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),

                            child: Text(
                              "AB-",
                              style: TextStyle(
                                color:
                                (!(bloodGroup==null)&&bloodGroup=="AB-")
                                    ? Colors.white
                                    : Colors.green,

                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 8,
                        ),

                        //7th blood group button
                        Expanded(
                          child: ElevatedButton(
                            onPressed:(){
                              setState(() {
                                if(bloodGroup==null||!(bloodGroup=="O+"))
                                {
                                  bloodGroup="O+";
                                }
                                else
                                {
                                  bloodGroup=null;
                                }
                              });
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              (!(bloodGroup==null)&&bloodGroup=="O+")
                                  ? Colors.green
                                  : Colors.white,

                              minimumSize: Size(
                                double.infinity,
                                48,
                              ),

                              elevation: 1,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),

                            child: Text(
                              "O+",
                              style: TextStyle(
                                color:
                                (!(bloodGroup==null)&&bloodGroup=="O+")
                                    ? Colors.white
                                    : Colors.green,

                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 8,
                        ),

                        //8th blood group button
                        Expanded(
                          child: ElevatedButton(
                            onPressed:(){
                              setState(() {
                                if(bloodGroup==null||!(bloodGroup=="O-"))
                                {
                                  bloodGroup="O-";
                                }
                                else
                                {
                                  bloodGroup=null;
                                }
                              });
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              (!(bloodGroup==null)&&bloodGroup=="O-")
                                  ? Colors.green
                                  : Colors.white,

                              minimumSize: Size(
                                double.infinity,
                                48,
                              ),

                              elevation: 1,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),

                            child: Text(
                              "O-",
                              style: TextStyle(
                                color:
                                (!(bloodGroup==null)&&bloodGroup=="O-")
                                    ? Colors.white
                                    : Colors.green,

                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 25,
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    //allergies title
                    Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),

                        Text(
                          "Allergies (Optional)",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 7,
                    ),

                    //allergies input
                    Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),

                        Expanded(
                          child: TextFormField(
                            controller: allergiesController,
                            keyboardType: TextInputType.text,

                            decoration: InputDecoration(
                              hintText: "e.g. Penicillin, Peanuts",

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

                        SizedBox(
                          width: 25,
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    //chronic conditions title
                    Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),

                        Text(
                          "Chronic Conditions (Optional)",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 7,
                    ),

                    //chronic conditions input
                    Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),

                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: chronicConditionsController,

                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),

                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 13,
                              ),

                              hintText: "e.g. Diabetes, Asthma",
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 25,
                        )
                      ],
                    ),
                  ],
                ),
              ),

              Spacer(),

              //bottom button row
              Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),

                  Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed:(){
                          Navigator.pop(
                            context,
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
                        ),

                        child: Text(
                          "Back",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                  ),

                  SizedBox(
                    width: 15,
                  ),

                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed:(){
                          setState(() {
                            if(bloodGroup==null)
                            {
                              checkBloodGroup=false;
                            }
                            else
                            {
                              checkBloodGroup=true;
                            }

                            if (formKey.currentState!.validate()&&checkBloodGroup){
                              height=heightController.text;
                              weight=weightController.text;
                              allergies=allergiesController.text;
                              chronicConditions=chronicConditionsController.text;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context)=>RegistrationScreen3(phone:widget.phone)
                                )
                              );
                            }
                          });
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Continue",
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
                            )
                          ],
                        ),
                      )
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
          )
      ),
    );
  }
}