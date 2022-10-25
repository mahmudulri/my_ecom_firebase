import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Home Screen"),
          Container(
            color: Colors.green,
            child: Text(
              "You are now Logged In",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ],
      )),
    ));
  }
}
