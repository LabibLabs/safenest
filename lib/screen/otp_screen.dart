import 'package:flutter/material.dart';
class OTPScreen extends StatefulWidget
{
  final String? phone;
  const OTPScreen({
    required this.phone,
    super.key,
  });
  @override
  State<OTPScreen> createState()=>_OTPScreenState();
}
class _OTPScreenState extends State<OTPScreen>
{
  TextEditingController otp1=TextEditingController();
  TextEditingController otp2=TextEditingController();
  TextEditingController otp3=TextEditingController();
  TextEditingController otp4=TextEditingController();
  TextEditingController otp5=TextEditingController();
  TextEditingController otp6=TextEditingController();
  FocusNode focus1=FocusNode();
  FocusNode focus2=FocusNode();
  FocusNode focus3=FocusNode();
  FocusNode focus4=FocusNode();
  FocusNode focus5=FocusNode();
  FocusNode focus6=FocusNode();
  final formKey=GlobalKey<FormState>();
  bool otpFill=true;
  bool resentAppear=false;
  bool clickIcon=false;

  @override
  void dispose() {
    otp1.dispose();
    otp2.dispose();
    otp3.dispose();
    otp4.dispose();
    otp5.dispose();
    otp6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body:Container(
        width: double.infinity,
        height: double.infinity,

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 18,
              ),
              TextButton.icon(
                  onPressed:(){
                    Navigator.pop(
                      context,
                    );
                  },
                  icon: Icon(
                      Icons.arrow_back,
                    size: 22,
                  ),
                  label: Text(
                      "Back",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                  "Verify OTP",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Text(
                "Sent to ${widget.phone}",
                style: TextStyle(
                  color:Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              )
            ],
          ),
          ),
            SizedBox(
              height: 60,
            ),
            Text(
              "Enter the 6-digit code",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Form(
             key:formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  SizedBox(
                    width:20,
                  ),

                  //OTP 1 text form field
                  Expanded(
                      flex: 1,
                      child:TextFormField(
                        controller: otp1,
                        focusNode: focus1,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        onChanged: (value){
                          if(value.isNotEmpty&&int.tryParse(value)!=null)
                            {
                              FocusScope.of(context).requestFocus(focus2);
                            }
                          if(int.tryParse(value)==null&&value.isNotEmpty)
                          {
                            otp1.clear();
                          }
                          else if(value.isEmpty)
                            {
                              FocusScope.of(context).requestFocus(focus1);
                            }
                          setState(() {

                          });
                        },
                        validator: (value){
                          if(value==null||value.isEmpty)
                          {
                            return "";
                          }
                          return null;
                        },
                        style: TextStyle(
                          color: otp1.text.isNotEmpty?
                              Colors.white:
                              Colors.black,
                        ),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: "0",
                            counterText: "",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                          fillColor: otp1.text.isNotEmpty?
                          Colors.green[400]:
                          Colors.grey[350],
                        ),
                      )
                  ),

                  SizedBox(
                    width: 10,
                  ),

                  //OTP 2 text form field
                  Expanded(
                      flex:1,
                      child:TextFormField(
                        controller: otp2,
                        focusNode: focus2,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        onChanged: (value){
                          if(value.isNotEmpty&&int.tryParse(value)!=null){
                            FocusScope.of(context).requestFocus(focus3);
                          }
                          if(int.tryParse(value)==null&&value.isNotEmpty)
                          {
                            otp2.clear();
                          }
                          else if(value.isEmpty)
                            {
                              FocusScope.of(context).requestFocus(focus1);
                            }
                          setState(() {

                          });
                        },
                        validator: (value){
                          if(value==null||value.isEmpty)
                          {
                            return "";
                          }
                          return null;
                        },
                        style: TextStyle(
                          color: otp2.text.isNotEmpty?
                              Colors.white:
                              Colors.black,
                        ),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: otp2.text.isNotEmpty?
                            Colors.green[400]:
                            Colors.grey[350],
                          hintText: "0",
                          counterText: "",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                        ),
                      )
                  ),

                  SizedBox(
                    width: 10,
                  ),

                  //OTP 3 text form field
                  Expanded(
                      flex: 1,
                      child:TextFormField(
                        controller: otp3,
                        focusNode: focus3,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        onChanged: (value){
                          if(value.isNotEmpty&&int.tryParse(value)!=null){
                            FocusScope.of(context).requestFocus(focus4);
                          }
                          if(int.tryParse(value)==null&&value.isNotEmpty)
                          {
                            otp3.clear();
                          }
                          else if(value.isEmpty)
                            {
                              FocusScope.of(context).requestFocus(focus2);
                            }
                          setState(() {

                          });
                        },
                        validator: (value){
                          if(value==null||value.isEmpty)
                          {
                            return "";
                          }
                          return null;
                        },
                        style: TextStyle(
                          color: otp3.text.isNotEmpty?
                              Colors.white:
                              Colors.black,
                        ),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: "0",
                            counterText: "",
                            filled: true,
                            fillColor: otp3.text.isNotEmpty?
                              Colors.green[400]:
                              Colors.grey[350],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                        ),
                      )
                  ),

                  SizedBox(
                    width: 10,
                  ),

                  //OTP 4 text form field
                  Expanded(
                    flex:1,
                    child: TextFormField(
                      controller: otp4,
                      focusNode: focus4,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      onChanged: (value){
                        if(value.isNotEmpty&&int.tryParse(value)!=null){
                          FocusScope.of(context).requestFocus(focus5);
                        }
                        if(int.tryParse(value)==null&&value.isNotEmpty)
                        {
                          otp4.clear();
                        }
                        else if(value.isEmpty)
                          {
                            FocusScope.of(context).requestFocus(focus3);
                          }
                        setState(() {

                        });
                      },
                      validator: (value){
                        if(value==null||value.isEmpty)
                        {
                          return "";
                        }
                        return null;
                      },
                      style: TextStyle(
                        color: otp4.text.isNotEmpty?
                          Colors.white:
                          Colors.black,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: otp4.text.isNotEmpty?
                          Colors.green[400]:
                          Colors.grey[350],
                        counterText: "",
                        hintText: "0",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 10,
                  ),

                  //OTP 5 text form field
                  Expanded(
                      flex:1,
                      child:TextFormField(
                        controller: otp5,
                        focusNode: focus5,
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        onChanged: (value){
                          if(value.isNotEmpty&&int.tryParse(value)!=null){
                            FocusScope.of(context).requestFocus(focus6);
                          }
                          if(int.tryParse(value)==null&&value.isNotEmpty)
                          {
                            otp5.clear();
                          }
                          else if(value.isEmpty)
                            {
                              FocusScope.of(context).requestFocus(focus4);
                            }
                          setState(() {

                          });
                        },
                        validator: (value){
                          if(value==null||value.isEmpty)
                          {
                            return "";
                          }
                          return null;
                        },
                        style: TextStyle(
                          color: otp5.text.isNotEmpty?
                            Colors.white:
                            Colors.black,
                        ),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "0",
                          counterText: "",
                          filled: true,
                          fillColor: otp5.text.isNotEmpty?
                            Colors.green[400]:
                            Colors.grey[350],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                        ),
                      )
                  ),

                  SizedBox(
                    width: 10,
                  ),

                  //OTP 6 text form field
                  Expanded(
                      flex: 1,
                      child:TextFormField(
                        controller: otp6,
                        focusNode: focus6,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        onChanged: (value){
                          if(value.isNotEmpty&&int.tryParse(value)!=null)
                            {

                            }
                          if(int.tryParse(value)==null&&value.isNotEmpty)
                          {
                            otp6.clear();
                          }
                          else if(value.isEmpty)
                            {
                              FocusScope.of(context).requestFocus(focus5);
                            }
                          setState(() {

                          });
                        },
                        validator: (value){
                          if(value==null||value.isEmpty)
                          {
                            return "";
                          }
                          return null;
                        },
                        style: TextStyle(
                          color: otp6.text.isNotEmpty?
                              Colors.white:
                              Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: "0",
                          counterText: "",
                          filled: true,
                          fillColor: otp6.text.isNotEmpty?
                            Colors.green[400]:
                            Colors.grey[350],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                        ),
                      )
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
            Text(
              "Enter OTP",
              style: TextStyle(
                color: otpFill?
                Colors.white:
                Colors.red,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  clickIcon?Icons.check:null,
                  color: Colors.green,
                  size:30,
                  fontWeight: FontWeight.bold,
                ),
                TextButton(
                  onPressed: resentAppear?(){
                    if(otp1.text.isNotEmpty&&otp2.text.isNotEmpty&&otp3.text.isNotEmpty&&otp4.text.isNotEmpty&&otp5.text.isNotEmpty&&otp6.text.isNotEmpty)
                    {
                      resentAppear=false;

                      Future.delayed(
                          Duration(seconds: 30),
                              (){
                            setState(() {
                              if(otp1.text.isNotEmpty||otp2.text.isNotEmpty||otp3.text.isNotEmpty||otp4.text.isNotEmpty||otp5.text.isNotEmpty||otp6.text.isNotEmpty)
                              {
                                resentAppear=true;
                              }
                            });
                          }
                      );
                      otp1.clear();
                      otp2.clear();
                      otp3.clear();
                      otp4.clear();
                      otp5.clear();
                      otp6.clear();
                      FocusScope.of(context).requestFocus(focus1);
                    }
                    else
                    {
                      resentAppear=false;
                    }
                    setState(() {

                    });
                  }:null,
                  child:Text(
                    "Resend OTP in 30 seconds",
                    style: TextStyle(
                      color: resentAppear?
                      Colors.black:
                      Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
                padding:EdgeInsets.symmetric(
                  horizontal: 30,
                ),
              child: ElevatedButton(
                  onPressed:(){
                    if(formKey.currentState!.validate())
                    {

                    }
                    setState(() {
                      if(otp1.text.isNotEmpty&&otp2.text.isNotEmpty&&otp3.text.isNotEmpty&&otp4.text.isNotEmpty&&otp5.text.isNotEmpty&&otp6.text.isNotEmpty)
                      {
                        otpFill=true;
                        clickIcon=true;
                        Future.delayed(
                          Duration(seconds: 30),
                            (){
                            setState(() {
                              resentAppear=true;
                            });
                            }
                        );
                      }
                      else
                      {
                        otpFill=false;
                        resentAppear=false;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 60),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Verify & Continue",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  )
              ),

            ),
          ],
        ),
      )
    );
  }
}