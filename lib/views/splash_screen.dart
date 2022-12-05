import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_ecom_firebase/const/app_colors.dart';
import 'package:my_ecom_firebase/const/app_strings.dart';
import 'package:my_ecom_firebase/ui/route/route.dart';
import 'package:my_ecom_firebase/views/authpages/sign_in_screen.dart';
import 'package:my_ecom_firebase/views/homepage.dart';
import 'package:my_ecom_firebase/views/sign_up.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();

  Future chooseScreen() async {
    var userID = await box.read('uid');

    if (userID == null) {
      Get.toNamed(onboarding);
      // Navigator.push(context, CupertinoPageRoute(builder: (_) => Homepage()));
    } else {
      Get.toNamed(bottomNavController);
      // Navigator.push(
      //     context, CupertinoPageRoute(builder: (_) => SignInScreen()));
    }
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () => chooseScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    // Timer(Duration(seconds: 2), () => chooseScreen(context));

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(""),
              Image.asset(
                "assets/logo/pakiza_logo.png",
                height: 100,
                width: 100,
              ),
              SizedBox(
                height: screenHeight * 0.010,
              ),
              Text(
                "Travel Story by PTVL",
                style: TextStyle(
                  fontSize: screenWidth * 0.050,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
