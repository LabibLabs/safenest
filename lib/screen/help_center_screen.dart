import 'package:flutter/material.dart';
import 'package:safenest/screen/unavailable_screen.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});


  static const Color backgroundColor = Color(0xFFEDF8F2);
  static const Color brownColor = Color(0xFF6B4B40);
  static const Color cardColor = Colors.white;
  static const Color redColor = Color(0xFFC94F4F);
  static const Color greyText = Color(0xFF777777);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [


              Container(
                width: double.infinity,

                padding: const EdgeInsets.fromLTRB(
                  20,
                  20,
                  20,
                  27,
                ),

                decoration: const BoxDecoration(
                  color: brownColor,

                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      'Help Center',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),


                    const Text(
                      "We're here to help",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),

                child: Row(
                  children: [

                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    FeatureUnavailableScreen(),
                              )
                          );
                        },

                        child: _helpOption(
                          icon: Icons.phone,
                          iconColor: Colors.pink,
                          title: 'Contact Support',
                        ),
                      ),
                    ),

                    const SizedBox(width: 11),

                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    FeatureUnavailableScreen(),
                              )
                          );
                        },

                        child: _helpOption(
                          icon: Icons.chat_bubble,
                          iconColor: Colors.purple.shade200,
                          title: 'Live Chat',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 11),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),

                child: Row(
                  children: [

                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    FeatureUnavailableScreen(),
                              )
                          );
                        },

                        child: _helpOption(
                          icon: Icons.video_library,
                          iconColor: Colors.orange.shade300,
                          title: 'Video Tutorial',
                        ),
                      ),
                    ),

                    const SizedBox(width: 11),

                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    FeatureUnavailableScreen(),
                              )
                          );
                        },

                        child: _helpOption(
                          icon: Icons.bug_report,
                          iconColor: Colors.green.shade400,
                          title: 'Report Bug',
                        ),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 15),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),

                child: Container(
                  width: double.infinity,

                  padding: const EdgeInsets.fromLTRB(
                    17,
                    17,
                    17,
                    14,
                  ),

                  decoration: BoxDecoration(
                    color: cardColor,

                    borderRadius: BorderRadius.circular(16),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .06),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),

                  child: Column(
                    children: [


                      Row(
                        children: [

                          const Text(
                            '📞',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),

                          const SizedBox(width: 8),

                          const Text(
                            'Emergency Numbers (Bangladesh)',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF333333),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),


                      _emergencyRow(
                        icon: '🚓',
                        title: 'Police',
                        number: '999',
                      ),


                      _emergencyRow(
                        icon: '🚑',
                        title: 'Ambulance',
                        number: '999',
                      ),


                      _emergencyRow(
                        icon: '👩',
                        title: 'Women Helpline',
                        number: '109',
                      ),


                      _emergencyRow(
                        icon: '🚒',
                        title: 'Fire',
                        number: '102',
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),

                child: Container(
                  width: double.infinity,

                  padding: const EdgeInsets.symmetric(
                    vertical: 19,
                    horizontal: 15,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(16),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .06),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),

                  child: Column(
                    children: [


                      const Text(
                        'About SafeNest',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                        ),
                      ),

                      const SizedBox(height: 8),


                      const Text(
                        'Version 2.23.24 • Build 29.09.2026',
                        style: TextStyle(
                          fontSize: 13,
                          color: greyText,
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      const SizedBox(height: 5),


                      const Text(
                        'Made with ❤️ for seniors across Bangladesh',
                        style: TextStyle(
                          fontSize: 12,
                          color: greyText,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }


  static Widget _helpOption({
    required IconData icon,
    required Color iconColor,
    required String title,
  }) {
    return Container(
      height: 90,

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(14),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [


          Container(
            width: 44,
            height: 44,

            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: .08),
              shape: BoxShape.circle,
            ),

            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),

          const SizedBox(height: 7),


          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF666666),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }


  static Widget _emergencyRow({
    required String icon,
    required String title,
    required String number,
  }) {
    return SizedBox(
      height: 37,

      child: Row(
        children: [


          SizedBox(
            width: 38,

            child: Text(
              icon,
              textAlign: TextAlign.center,

              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),


          Expanded(
            child: Text(
              title,

              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF555555),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),


          Text(
            number,

            style: const TextStyle(
              fontSize: 16,
              color: redColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}