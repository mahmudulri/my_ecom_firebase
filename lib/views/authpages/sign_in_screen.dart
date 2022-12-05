import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:my_ecom_firebase/business_logic/auth.dart';
import 'package:my_ecom_firebase/helper/auth_helper.dart';
import 'package:my_ecom_firebase/ui/route/route.dart';
import 'package:my_ecom_firebase/ui/styles/styles.dart';
import 'package:my_ecom_firebase/ui/widgets/violetButton.dart';

class SignInScreen extends StatelessWidget {
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.050,
              ),
              Text(
                "Login\nTo Your Account",
                style: TextStyle(
                  color: Color(0xff8000FF),
                  fontSize: screenWidth * 0.070,
                ),
              ),
              SizedBox(
                height: 80,
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
              VioletButton(
                "Login",
                () => Auth().login(
                    _emailController.text, _passwordController.text, context),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not Registered Yet ?"),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: () {
                        Get.toNamed(signupscreen);
                      },
                      child: Text(
                        "Sign up Now",
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
      ),
    ));
  }
}
