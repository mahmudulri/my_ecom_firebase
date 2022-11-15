import 'package:flutter/material.dart';

class AppStyles {
  TextStyle mytextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );

  InputDecoration textFieldDecoration(String hintText) => InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: 15,
      ));
}
