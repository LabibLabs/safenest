import "package:flutter/material.dart";
import "package:safenest/screen/otp_screen.dart";
import "package:safenest/screen/registration_screen_1.dart";
import "package:safenest/screen/otp_screen.dart";
class LoginScreen extends StatefulWidget
{
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState()=>_LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final phoneController= TextEditingController();
  bool phoneNumberFill=false;
  bool validPhoneNumber=false;
  String ?phone;

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFB5DABF),
                    Color(0xFFF1F8F1)
                  ],
                  stops: [
                    0,
                    .4,
                  ]
              ),
            ),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/safenest_logo.png",
                      width: 300,
                      height: 300,
                    ),
                    Text(
                      "SafeNest",
                      style: TextStyle(
                        fontSize: 53,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Care",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(6),
                          child: Icon(
                            Icons.circle,
                            color: Colors.black,
                            size: 8,
                          ),
                        ),
                        Text(
                          "Health",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsGeometry.all(6),
                          child: Icon(
                            Icons.circle,
                            color: Colors.black,
                            size: 8,
                          ),
                        ),
                        Text(
                          "Safety",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),


                // this container for left alignment things
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Welcome Back",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),

                      //text for login to your safenest account
                      Text(
                        "Login to your SafeNest account",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      SizedBox(
                        height: 25,
                      ),

                      //phone number text
                      Row(
                        children: [
                          Text(
                            "Phone Number*",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            validPhoneNumber?"Enter valid Phone Number":"Enter your Phone Number",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: phoneNumberFill?
                              Colors.red:
                              Colors.white,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      // phone number
                      Row(
                        children: [

                          //text +88
                          Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  shape: BoxShape.rectangle,
                                  color: Colors.grey[300],
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),

                                child: Text(
                                  "+88",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                          ),

                          SizedBox(
                            width: 18,
                          ),

                          //for phone number text field
                          Expanded(
                              flex: 3,
                              child: SizedBox(
                                height: 50,
                                child: TextField(
                                  controller: phoneController,
                                  maxLength: 11,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: "01xxxxxxxxx",
                                    filled: true,
                                    fillColor: Colors.grey[300],
                                  ),

                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      //send otp button
                      ElevatedButton(
                          onPressed: (){
                            setState(() {
                              if(phoneController.text.isEmpty|| phoneController.text.length != 11)
                                {
                                  if(phoneController.text.isEmpty)
                                    {
                                      validPhoneNumber=false;
                                    }
                                  else
                                    {
                                      validPhoneNumber=true;
                                    }
                                  phoneNumberFill=true;
                                }
                              else if(phoneController.text.isNotEmpty)
                                {
                                  phoneNumberFill=false;
                                  phone=phoneController.text;
                                  if(!context.mounted) return;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context)=>OTPScreen(phone: phone,),
                                      )
                                  );
                                }
                            });
                          },

                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity,50),
                            backgroundColor: Colors.green,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),

                          child: Text(
                            "Send OTP",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          )
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    //text
                    Text(
                      "New to SafeNest?",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),

                    //Registration button
                    TextButton(
                        onPressed: (){
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(
                                  builder: (context)=>RegistrationScreen1(),
                              )
                          );
                        },

                        child: Text(
                          "Register Now",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.green,
                          ),
                        ),
                    )
                  ],
                )
              ],
            )
        )
    );
  }
}
