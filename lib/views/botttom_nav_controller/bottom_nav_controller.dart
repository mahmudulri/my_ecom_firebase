import 'package:flutter/material.dart';

class BottomNavController extends StatelessWidget {
  const BottomNavController({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Text("bottom nav controller"),
      ),
    ));
  }
}
