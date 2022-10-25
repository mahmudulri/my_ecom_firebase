import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_ecom_firebase/views/homepage.dart';
import 'package:my_ecom_firebase/views/sign_up.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final box = GetStorage();

  chooseScreen(context) async {
    var userID = await box.read('id');

    if (userID != null) {
      Navigator.push(context, CupertinoPageRoute(builder: (_) => Homepage()));
    } else {
      Navigator.push(
          context, CupertinoPageRoute(builder: (_) => SignUpScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () => chooseScreen(context));
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
