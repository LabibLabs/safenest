import 'package:flutter/material.dart';
import 'package:safenest/screen/privacy_policy.dart';
import 'welcome_screen.dart';

class PermissionItem {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;

  PermissionItem({
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
  });
}

class PrivacyAndPermissionScreen extends StatefulWidget {
  const PrivacyAndPermissionScreen({super.key});
  @override
  State<PrivacyAndPermissionScreen> createState() =>
      _PrivacyAndPermissionScreen();
}

class _PrivacyAndPermissionScreen extends State<PrivacyAndPermissionScreen> {
  bool understandButton = false;
  bool continueButton = false;

  // List of permissions
  final List<PermissionItem> permissions = [
    PermissionItem(
        title: "Notifications",
        icon: Icons.notifications,
        iconColor: Colors.orange,
        bgColor: Colors.orange[100]!),
    PermissionItem(
        title: "Location",
        icon: Icons.location_on,
        iconColor: Colors.pink,
        bgColor: Colors.pink[100]!),
    PermissionItem(
        title: "Camera",
        icon: Icons.camera_alt,
        iconColor: Colors.black,
        bgColor: Colors.blueGrey[200]!),
    PermissionItem(
        title: "Phone Call",
        icon: Icons.call,
        iconColor: Colors.pink,
        bgColor: Colors.pink[100]!),
    PermissionItem(
        title: "Microphone",
        icon: Icons.mic,
        iconColor: Colors.black54,
        bgColor: Colors.lightBlue[200]!),
    PermissionItem(
        title: "SMS",
        icon: Icons.sms,
        iconColor: Colors.purpleAccent,
        bgColor: Colors.purple[100]!),
    PermissionItem(
        title: "Activity Recognition",
        icon: Icons.directions_walk,
        iconColor: Colors.orange,
        bgColor: Colors.orange[100]!),
    PermissionItem(
        title: "Storage",
        icon: Icons.storage,
        iconColor: Colors.amber,
        bgColor: Colors.amber[100]!),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            // Header
            Container(
              width: double.infinity,
              height: 100,
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
                  SizedBox(width: 6),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.privacy_tip_rounded,
                      size: 60,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 18),
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
            SizedBox(height: 10),

            // Subtext
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SizedBox(width: 5),
                  Icon(
                    Icons.security_outlined,
                    color: Colors.white60,
                    size: 40,
                  ),
                  SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      "SafeNest requests only the permission it needs to protect you and your loved ones. Your data stays private and is never sold",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),

            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: permissions.length,
                separatorBuilder: (context, index) => SizedBox(height: 15),
                itemBuilder: (context, index) {
                  final item = permissions[index];
                  return Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          spreadRadius: 2,
                          color: Colors.black12, // Added slight color to shadow for realism
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 15),
                        Container(
                          width: 50,
                          height: 46,
                          decoration: BoxDecoration(
                            color: item.bgColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            item.icon,
                            color: item.iconColor,
                            size: 40,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            item.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22, // Adjusted slightly so longer texts don't overflow
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(
                          Icons.check_circle,
                          color: understandButton ? Colors.green : Colors.grey,
                          size: 30,
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8),

            // Checkbox button
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (!understandButton) {
                        understandButton = true;
                      } else {
                        understandButton = false;
                        continueButton = false;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.check_box,
                    color: understandButton ? Colors.green : Colors.grey,
                    size: 33,
                  ),
                ),
                Text(
                  "I understand and agree to the",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PrivacyPolicy()));
                    },
                    child: Text(
                      "Privacy Policy",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (understandButton) {
                    continueButton = true;
                    Future.delayed(Duration(milliseconds: 200), () {
                      if (!context.mounted) return;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomeScreen(),
                        ),
                      );
                    });
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: continueButton ? Colors.green : Colors.grey,
                minimumSize: (Size(double.infinity, 40)),
              ),
              child: Text(
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
      ),
    );
  }
}