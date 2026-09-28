import 'package:flutter/material.dart';
import 'package:safenest/screen/health_tracker.dart';
import 'package:safenest/screen/help_center_screen.dart';
import 'package:safenest/screen/home_screen.dart';
import 'package:safenest/screen/my_medicine_screen.dart';

class MainScreen extends StatefulWidget
{
  const MainScreen({super.key});
  @override
  State<MainScreen> createState()=>_MainScreenState();
}
class _MainScreenState extends State<MainScreen>
{
  int _selectedIndex=0;
  final List<Widget> _screens=[
    HomeScreen(),
    MyMedicineScreen(),
    HealthCenter(),
    HelpCenterScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF4F86A3),
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items:  [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.medication),
              label: "Medicines",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Health",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help_center_outlined),
              label: "Help Center",
            ),
          ],
        ),
    );
  }
}