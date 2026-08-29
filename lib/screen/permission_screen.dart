import 'package:flutter/material.dart';

class PrivacyPermissionsScreen extends StatefulWidget {
  const PrivacyPermissionsScreen({super.key});

  @override
  State<PrivacyPermissionsScreen> createState() =>
      _PrivacyPermissionsScreenState();
}

class _PrivacyPermissionsScreenState
    extends State<PrivacyPermissionsScreen> {
  bool notifications = false;
  bool location = false;
  bool camera = false;
  bool phoneCall = false;
  bool microphone = false;
  bool sms = false;
  bool activityRecognition = false;
  bool storage = false;

  bool privacyAgreement = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 12, 18, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  width: double.infinity,
                  height: 112,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF079A43),
                        Color(0xFF087FC7),
                        Color(0xFF1255C9),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [

                      Container(
                        width: 58,
                        height: 66,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          'assets/shield.png',
                          width: 52,
                          height: 58,
                          fit: BoxFit.contain,
                        ),
                      ),

                      const SizedBox(width: 14),


                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Privacy & Permissions',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'SafeNest needs these to keep you safe',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11.5,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 14),


                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 3),
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: Color(0xFF20A64B),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            color: Color(0xFF555555),
                            fontSize: 11,
                            height: 1.35,
                          ),
                          children: [
                            TextSpan(
                              text:
                              'SafeNest requests only the permissions it needs '
                                  'to protect you and your loved ones. Your data '
                                  'stays private and is never sold.',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 7),

                const Divider(
                  height: 1,
                  color: Color(0xFFE8E8E8),
                ),


                PermissionItem(
                  icon: Icons.notifications,
                  iconColor: const Color(0xFFFFB900),
                  title: 'Notifications',
                  subtitle: 'Medicine & appointment reminders',
                  selected: notifications,
                  onTap: () {
                    setState(() {
                      notifications = !notifications;
                    });
                  },
                ),

                PermissionItem(
                  icon: Icons.location_pin,
                  iconColor: const Color(0xFFE92D62),
                  title: 'Location',
                  subtitle: 'Emergency SOS & fall detection',
                  selected: location,
                  onTap: () {
                    setState(() {
                      location = !location;
                    });
                  },
                ),

                PermissionItem(
                  icon: Icons.camera_alt,
                  iconColor: const Color(0xFF444444),
                  title: 'Camera',
                  subtitle: 'Medicine scan & face recognition',
                  selected: camera,
                  onTap: () {
                    setState(() {
                      camera = !camera;
                    });
                  },
                ),

                PermissionItem(
                  icon: Icons.phone,
                  iconColor: const Color(0xFFE72B5D),
                  title: 'Phone Call',
                  subtitle: 'Emergency contact calling',
                  selected: phoneCall,
                  onTap: () {
                    setState(() {
                      phoneCall = !phoneCall;
                    });
                  },
                ),

                PermissionItem(
                  icon: Icons.mic,
                  iconColor: const Color(0xFF555555),
                  title: 'Microphone',
                  subtitle: 'Voice commands & AI Friend',
                  selected: microphone,
                  onTap: () {
                    setState(() {
                      microphone = !microphone;
                    });
                  },
                ),

                PermissionItem(
                  icon: Icons.sms,
                  iconColor: const Color(0xFF9C50D6),
                  title: 'SMS',
                  subtitle: 'Emergency SMS to family',
                  selected: sms,
                  onTap: () {
                    setState(() {
                      sms = !sms;
                    });
                  },
                ),

                PermissionItem(
                  icon: Icons.directions_run,
                  iconColor: const Color(0xFFFF9F19),
                  title: 'Activity Recognition',
                  subtitle: 'Fall detection & step counting',
                  selected: activityRecognition,
                  onTap: () {
                    setState(() {
                      activityRecognition = !activityRecognition;
                    });
                  },
                ),

                PermissionItem(
                  icon: Icons.folder,
                  iconColor: const Color(0xFFFFB900),
                  title: 'Storage',
                  subtitle: 'Save preferences & health data',
                  selected: storage,
                  onTap: () {
                    setState(() {
                      storage = !storage;
                    });
                  },
                ),

                const SizedBox(height: 14),


                GestureDetector(
                  onTap: () {
                    setState(() {
                      privacyAgreement = !privacyAgreement;
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          color: privacyAgreement
                              ? const Color(0xFF10A548)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: privacyAgreement
                                ? const Color(0xFF10A548)
                                : const Color(0xFFBFC4C8),
                            width: 1.5,
                          ),
                        ),
                        child: privacyAgreement
                            ? const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 16,
                        )
                            : null,
                      ),

                      const SizedBox(width: 8),

                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: Color(0xFF555555),
                              fontSize: 10.5,
                              height: 1.35,
                            ),
                            children: [
                              const TextSpan(
                                text: 'I understand and agree to the ',
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: const TextStyle(
                                  color: Color(0xFF225DCA),
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const TextSpan(
                                text: ' and ',
                              ),
                              TextSpan(
                                text: 'Terms & Conditions',
                                style: const TextStyle(
                                  color: Color(0xFF225DCA),
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 14),


                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: privacyAgreement
                        ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Permissions saved!'),
                        ),
                      );
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF08A746),
                      disabledBackgroundColor: const Color(0xFF9BD9B4),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class PermissionItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  const PermissionItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 59,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFECECEC),
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [

            SizedBox(
              width: 42,
              child: Icon(
                icon,
                color: iconColor,
                size: 22,
              ),
            ),

            const SizedBox(width: 4),


            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 2),

                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF777777),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),


            GestureDetector(
              onTap: onTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 21,
                height: 21,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected ? const Color(0xFF0BA548) : Colors.white,
                  border: Border.all(
                    color: selected
                        ? const Color(0xFF0BA548)
                        : const Color(0xFFC8CDD0),
                    width: 1.3,
                  ),
                ),
                child: selected
                    ? const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 14,
                )
                    : null,
              ),
            ),

            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}