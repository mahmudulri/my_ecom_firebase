import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecom_firebase/ui/widgets/violetButton.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            VioletButton("Agree", () {}, false.obs)
          ],
        ),
      ),
    ));
  }
}
