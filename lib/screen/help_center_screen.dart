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
                  28,
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



                    TextButton(
                    onPressed: () {
                        Navigator.pop(context);
                      },

                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),

                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 22,
                          ),

                          SizedBox(width: 5),

                          Text(
                            'Back',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),



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
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:(context)=>FeatureUnavailableScreen(),
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
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:(context)=>FeatureUnavailableScreen(),
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
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:(context)=>FeatureUnavailableScreen(),
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
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:(context)=>FeatureUnavailableScreen(),
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
                        'Version 2.4.1 • Build 2025.07.17',
                        style: TextStyle(
                          fontSize: 12,
                          color: greyText,
                        ),
                      ),

                      const SizedBox(height: 5),



                      const Text(
                        'Made with ❤️ for seniors across Bangladesh',
                        style: TextStyle(
                          fontSize: 11,
                          color: greyText,
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



      bottomNavigationBar: _bottomNavigationBar(),
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


  static Widget _bottomNavigationBar() {
    return Container(
      height: 65,

      decoration: BoxDecoration(
        color: Colors.white,

        border: Border(
          top: BorderSide(
            color: Colors.grey.shade200,
            width: 0.8,
          ),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [

          _bottomItem(
            icon: Icons.home,
            label: 'Home',
            active: true,
          ),

          _bottomItem(
            icon: Icons.medication,
            label: 'Medicines',
          ),

          _bottomItem(
            icon: Icons.favorite,
            label: 'Health',
          ),

          _bottomItem(
            icon: Icons.smart_toy,
            label: 'AI Friend',
          ),

          _bottomItem(
            icon: Icons.person,
            label: 'Profile',
          ),
        ],
      ),
    );
  }



  static Widget _bottomItem({
    required IconData icon,
    required String label,
    bool active = false,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        Icon(
          icon,
          size: 23,

          color: active
              ? const Color(0xFF65A87D)
              : const Color(0xFF9DA9A2),
        ),

        const SizedBox(height: 4),

        Text(
          label,

          style: TextStyle(
            fontSize: 10,

            color: active
                ? const Color(0xFF65A87D)
                : const Color(0xFF9DA9A2),
          ),
        ),
      ],
    );
  }
}