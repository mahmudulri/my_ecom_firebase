import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:my_ecom_firebase/const/app_colors.dart';
import 'package:flutter/material.dart';

class VioletButton extends StatelessWidget {
  RxBool _value = false.obs;
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        _value.value = true;
        print(_value.toString());
      },
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: AppColors.violetColor,
        ),
        child: _value == false
            ? Text("Create Account") : Row(
              children: [
                Text("Please wait"),
                CircularProgressIndicator(),
              ],
            ),
            
      ),
    );
  }
}
