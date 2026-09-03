import 'package:flutter/material.dart';
import 'welcome_screen.dart';
//Note: this code is written by human
class PrivacyAndPermissionScreen extends StatefulWidget
{
  const PrivacyAndPermissionScreen({super.key});
  @override
  State<PrivacyAndPermissionScreen> createState()=>_PrivacyAndPermissionScreen();
}
class _PrivacyAndPermissionScreen extends State<PrivacyAndPermissionScreen>
{
  bool understandButton=false;
  bool continueButton=false;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        child:Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height:100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.green,
                    Colors.blue,
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 6,
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color:Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.privacy_tip_rounded,
                      size:60 ,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        "Privacy & Permissions",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "SafeNest needs these to keep you safe",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //for subtext
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                  Icon(
                  Icons.security_outlined,
                    color: Colors.white60,
                    // age icon r color chilo Colors.green[800]
                    size: 40,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                      child:Text(
                        "SafeNest requests only the permission it needs to protect you and your loved ones. Your data stays private and is never sold",
                        style: TextStyle(
                          fontWeight: FontWeight.w600
                        ),
                      ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height:55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:Colors.white,
                //Colors.orange[300] for icon
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    spreadRadius: 2,
                  )
                ]
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  //notification bar
                  Container(
                    width: 50,
                    height: 46,
                    decoration: BoxDecoration(
                      color:Colors.orange[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.orange,
                      size:40,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                      "Notifications",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Spacer(),
                  Icon(
                      Icons.check_circle,
                    color: understandButton?Colors.green:Colors.grey,
                    size:30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //location bar
            Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                //Colors.pink[200] for icon
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 2,
                  )
                ]
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 50,
                    height: 46,
                    decoration: BoxDecoration(
                      color:Colors.pink[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.pink,
                      size:40,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Location",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.check_circle,
                    color: understandButton?Colors.green:Colors.grey,
                    size:30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //camera bar
            Container(
              width: double.infinity,
              height:55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:Colors.white,
                  //Colors.blueGrey[200] for icon
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 2,
                    )
                  ]
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 50,
                    height: 46,
                    decoration: BoxDecoration(
                      color:Colors.blueGrey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.black,
                      size:40,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Camera",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.check_circle,
                    color: understandButton?Colors.green:Colors.grey,
                    size:30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //Phone call bar
            Container(
              width: double.infinity,
              height:55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:Colors.white,
                  //Colors.pinkAccent[100] for icon
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 2,
                    )
                  ]
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 50,
                    height: 46,
                    decoration: BoxDecoration(
                      color:Colors.pink[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.call,
                      color: Colors.pink,
                      size:40,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Phone Call",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.check_circle,
                    color: understandButton?Colors.green:Colors.grey,
                    size:30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),

            Container(
              width: double.infinity,
              height:55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:Colors.white,
                  //Colors.blue[300] for icon
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 2,
                    )
                  ]
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 50,
                    height: 46,
                    decoration: BoxDecoration(
                      color:Colors.lightBlue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.mic,
                      color: Colors.black54,
                      size:40,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Microphone",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.check_circle,
                    color: understandButton?Colors.green:Colors.grey,
                    size:30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height:55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:Colors.white,
                  //Colors.purple[300] for icon
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 2,
                    )
                  ]
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 50,
                    height: 46,
                    decoration: BoxDecoration(
                      color:Colors.purple[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.sms,
                      color: Colors.purpleAccent,
                      size:40,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "SMS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.check_circle,
                    color: understandButton?Colors.green:Colors.grey,
                    size:30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height:55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:Colors.white,
                  //Colors.orange[300] for icon
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 2,
                    )
                  ]
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 50,
                    height: 46,
                    decoration: BoxDecoration(
                      color:Colors.orange[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.directions_walk,
                      color: Colors.orange,
                      size:40,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Activity Recognition",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.check_circle,
                    color: understandButton?Colors.green:Colors.grey,
                    size:30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height:55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:Colors.white,
                  //Colors.amber[300] for icon
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 2,
                    )
                  ]
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 50,
                    height: 46,
                    decoration: BoxDecoration(
                      color:Colors.amber[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.storage,
                      color: Colors.amber,
                      size:40,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Storage",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.check_circle,
                    color: understandButton?Colors.green:Colors.grey,
                    size:30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                IconButton(
                    onPressed:(){
                      setState(() {
                        if(!understandButton)
                          {
                            understandButton=true;
                          }
                        else
                          {
                          understandButton=false;
                          continueButton=false;
                          }
                      });
                    },
                    icon:Icon(
                      Icons.check_box,
                      color: understandButton?Colors.green:Colors.grey,
                      size: 33,
                    ),
                ),
                Text(
                  "I understand and agree to the",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                    onPressed: (){},
                    child:Text(
                      "Privacy Policy",
                    )
                ),

              ],
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    if(understandButton) {
                      continueButton = true;
                    }
                  });
                  Future.delayed(
                    Duration(milliseconds: 300),
                      (){
                        if(!context.mounted)return;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder:(context)=>WelcomeScreen(),
                          ),
                        );
                      }
                  );
                },
              style: ElevatedButton.styleFrom(
                backgroundColor: continueButton?Colors.green:Colors.grey,
                 minimumSize: (
                 Size(double.infinity,40)
                 ),
              ),
                child:Text(
                    "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
            ),
          ],
        ),
      )
    );
  }
}