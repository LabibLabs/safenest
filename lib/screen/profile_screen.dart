import 'package:flutter/material.dart';
import 'package:safenest/screen/functions/get_height.dart';
import 'package:safenest/screen/functions/get_age.dart';
import 'package:safenest/screen/functions/get_gender.dart';
import 'package:safenest/screen/functions/get_blood_group.dart';
import 'package:safenest/screen/functions/get_phone_number.dart';
import 'package:safenest/screen/functions/get_user_name.dart';
import 'package:safenest/screen/welcome_screen.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
{

  TextEditingController nameController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAF3FC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 55,
          ),
          SizedBox(
            width: double.infinity,
            height: 145,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [

                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color(0xFF5E8BBA),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(35),
                      bottomLeft: Radius.circular(35),
                    ),
                  ),
                  alignment: Alignment.topLeft,
                  child: TextButton(onPressed: (){
                    Navigator.pop(context,true);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 23,
                          fontWeight: FontWeight.bold,
                      ),
                      Text(
                        "Back",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                  ),
                ),

                Positioned(
                  top: 50,
                  child: getGender()
                      ? (getAge()<60
                      ? Image.asset(
                    "assets/images/male_logo_1.png",
                    width: 220,
                    height: 220,
                  )
                      : Image.asset(
                    "assets/images/male_logo_2.png",
                    width: 220,
                    height: 220,
                  ))
                      : (getAge()<60
                      ? Image.asset(
                    "assets/images/female_logo_1.png",
                    width: 220,
                    height: 220,
                  )
                      : Image.asset(
                    "assets/images/female_logo_2.png",
                    width: 220,
                    height: 220,
                  )),
                ),
              ],
            ),
          ),

          SizedBox(
              height: 90,
          ),


             Text(
              getUserName(),
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

          SizedBox(
            height: 5,
          ),

          Text(
            "Bangladeshi",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black
            ),
          ),

          SizedBox(height: 20),

          _buildProfileItem(
            label: "Phone",
            value: getPhoneNumber(),
            icon: Icons.phone,
          ),
          _buildProfileItem(
            label: "Gender",
            value: getGender() ? "Male" : "Female",
            icon: Icons.person,
          ),
          _buildProfileItem(
            label: "Height",
            value: getHeight().toString(),
            icon: Icons.height,
          ),
          _buildProfileItem(
            label: "Blood Group",
            value: getBloodGroup(),
            icon: Icons.bloodtype,
          ),
          _buildProfileItem(
            label: "Age",
            value: getAge().toString(),
            icon: Icons.cake,
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(15),
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>WelcomeScreen()
                    )
                );
              },

                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 30),
                      backgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      )
                  ),

                  child: Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  )
              ),
            )
          ),

          SizedBox(
            height: 30,
          )

        ],
      ),
    );
  }
}

Widget _buildProfileItem({
    required  String label,
    required String value,
    required IconData icon,
  }) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8.0
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Color(0xFF5E8BBA),
        ),
        SizedBox(
            width: 12,
        ),
        Text(label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: Colors.black,
          )
        ),
        Spacer(),
        Text(value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Colors.black,
          )),
      ],
    ),
  );
}
