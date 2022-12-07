import 'package:flutter/material.dart';
import 'package:my_ecom_firebase/views/botttom_nav_controller/bottom_nav_controller.dart';
import 'package:my_ecom_firebase/views/drawer_screen.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Stack(
        children: [
          DrawerScreen(),
          BottomNavController(),
        ],
      ),
    );
  }
}
