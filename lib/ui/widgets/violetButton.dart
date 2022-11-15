import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:my_ecom_firebase/const/app_colors.dart';
import 'package:flutter/material.dart';

class VioletButton extends StatelessWidget {
  String buttonName;
  VioletButton(this.buttonName);
  RxBool _value = false.obs;
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Obx((() => InkWell(
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
                ? Center(
                    child: Text(
                      buttonName,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Please wait",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Transform.scale(
                          scale: 0.6,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          )),
                    ],
                  ),
          ),
        )));
  }
}
