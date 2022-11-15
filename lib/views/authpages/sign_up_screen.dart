import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:my_ecom_firebase/ui/route/route.dart';
import 'package:my_ecom_firebase/ui/styles/styles.dart';
import 'package:my_ecom_firebase/ui/widgets/violetButton.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.050,
            ),
            Text(
              "Travel Story by PTVL",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              "Create\nYour Account",
              style: TextStyle(
                color: Color(0xff8000FF),
                fontSize: screenWidth * 0.090,
              ),
            ),
            Text("Create your account and start your journey"),
            SizedBox(
              height: 60,
            ),
            TextFormField(
              controller: _emailController,
              decoration: AppStyles().textFieldDecoration("E-mail Address"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: AppStyles().textFieldDecoration("Password"),
            ),
            SizedBox(
              height: screenHeight * 0.100,
            ),
            VioletButton("Create New Account"),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already Registered ?"),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: () {
                      Get.toNamed(signInScreen);
                    },
                    child: Text(
                      "Log in Now",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
