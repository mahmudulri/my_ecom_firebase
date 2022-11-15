import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_ecom_firebase/const/app_colors.dart';
import 'package:my_ecom_firebase/const/app_strings.dart';
import 'package:my_ecom_firebase/ui/route/route.dart';
import 'package:my_ecom_firebase/views/sign_up.dart';

class OnBoardingScreen extends StatelessWidget {
  List<String> lottieFiles = [
    "assets/files/welcome.json",
    "assets/files/categories.json",
    "assets/files/support.json",
  ];

  List<String> title = [
    "Welcome",
    "Categories",
    "Support",
  ];

  List<String> descriptons = [
    "Welcome Ipsum is simply dummy text of the printing and typesetting industry. ",
    "Categories Ipsum is simply dummy text of the printing and typesetting industry. ",
    "Support Ipsum is simply dummy text of the printing and typesetting industry. ",
  ];

  @override
  Widget build(BuildContext context) {
    RxInt currentIndex = 0.obs;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Travel Story",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "by - PTVL",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => Expanded(
                flex: 7,
                child: Container(
                  color: AppColors.scaffoldColor,
                  child: Lottie.asset(lottieFiles[currentIndex.toInt()]),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.scaffoldColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(-4.0, -4.0),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Text(title[currentIndex.toInt()]),
                      ),
                      Obx(
                        () => Text(
                          descriptons[currentIndex.toInt()],
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx((() => DotsIndicator(
                                dotsCount: lottieFiles.length,
                                position: currentIndex.toDouble(),
                                decorator: DotsDecorator(),
                              ))),
                          InkWell(
                            onTap: () {
                              if (currentIndex == 2) {
                                Get.toNamed(signupscreen);
                              } else {
                                currentIndex + 1;
                              }
                              // Navigator.push(
                              //     context,
                              //     CupertinoPageRoute(
                              //         builder: (_) => SignUpScreen()));
                              // print(currentIndex);
                              // if (currentIndex == 3) {
                              //   // Get.toNamed(signupscreen);

                              // }
                              // currentIndex++;
                            },
                            child: Icon(Icons.arrow_forward_ios),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
