import 'package:flutter/material.dart';
import 'package:safenest/screen/privacy_and_permissions_screen.dart';

class SplashScreen extends StatefulWidget
{
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState()=>_SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>
{
  bool nextTitle=false;
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 1),
        (){
        setState(() {
          nextTitle=true;
        });
        }
    );
    Future.delayed(
      Duration(seconds: 3),
        (){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder:(context)=>PrivacyAndPermissionScreen(),
              )
            );
        }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
            ),
            Image.asset(
              "assets/images/safenest_logo.png",
              width: 270,
              height: 270,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Safe",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  nextTitle?"Nest":"",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Care",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Padding(
                    padding:EdgeInsets.all(6),
                  child: Icon(
                    Icons.circle,
                    size: 9,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Health",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding:EdgeInsets.all(6),
                  child: Icon(
                    Icons.circle,
                    size: 9,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Safety",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}