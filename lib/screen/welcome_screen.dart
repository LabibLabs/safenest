import 'package:flutter/material.dart';
class WelcomeScreen extends StatefulWidget
{
  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState()=> _WelcomeScreenState();
}
class _WelcomeScreenState extends State<WelcomeScreen>
{
  bool registerButton=false;
  bool haveAnAccountButton=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(
            right: 24,
            left: 24,
            top: 48,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFB5DABF),
                  Color(0xFFF1F8F1),
                ],
                stops: [
                  0,
                  .4,
                ]
            ),
          ),
          // column
          child: Column(
            children: [
              SizedBox(
                height:110,
              ),
              Image.asset(
                "assets/images/safenest_logo.png",
                width: 300,
                height: 300,
              ),
              //sized box for image and title
              SizedBox(
                height:10,
              ),
              //text for title
              Text(
                "safe nest",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                ),
              ),
              // row for subtitle
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 1st subtitle world
                  Text(
                    "Care",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  //1st dot
                  Padding(
                      padding: EdgeInsets.all(6),
                      child: Icon(
                        Icons.circle,
                        size: 8,
                      )
                  ),
                  //2nd subtitle word
                  Text(
                    "Health",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  //2nd dot
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      Icons.circle,
                      size:8,
                    ),
                  ),
                  //3rd subtitle word
                  Text(
                    "Safety",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              // for subtitle and description
              SizedBox(
                height: 40,
              ),
              //description text
              Text(
                "Your trusted AI companion for health,\nsafety, and happiness at home.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              // for description and registration button
              SizedBox(
                height: 25,
              ),
              //registration button
              ElevatedButton(
                onPressed:(){
                  setState(() {
                    if(!haveAnAccountButton&&!registerButton)
                    {
                      registerButton=true;
                    }
                    else if(!haveAnAccountButton&&registerButton)
                    {
                      registerButton=false;
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: registerButton?Colors.green:Colors.white,
                    minimumSize: Size(double.infinity,50),
                    side: BorderSide(
                      width: 3,
                      color: Colors.green,
                    ),
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )
                ),
                child:Text(
                  "Get Started Register",
                  style: TextStyle(
                    color: registerButton?Colors.white:Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              //for button space
              SizedBox(
                height: 25,
              ),
              //have an account button
              ElevatedButton(
                onPressed:(){
                  setState(() {
                    if(!registerButton&&!haveAnAccountButton)
                    {
                      haveAnAccountButton=true;
                    }
                    else if(!registerButton&&haveAnAccountButton)
                    {
                      haveAnAccountButton=false;
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: haveAnAccountButton?Colors.green:Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  side:BorderSide(
                    width: 3,
                    color: Colors.green,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child:Text(
                  "I Already Have an Account",
                  style: TextStyle(
                    color: haveAnAccountButton?Colors.white:Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}