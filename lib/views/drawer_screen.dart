import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.blueGrey,
            body: Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 25,
                bottom: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "PTVL",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Travel Story",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "My Profile",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Support",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    "Privacy",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    "FAQ",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    "Rate Us",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    "How to Use",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Icon(Icons.settings),
                      Text("Settings"),
                    ],
                  ),
                ],
              ),
            )));
  }
}
