import 'package:get/get.dart';
import 'package:my_ecom_firebase/views/authpages/sign_in_screen.dart';
import 'package:my_ecom_firebase/views/authpages/sign_up_screen.dart';
import 'package:my_ecom_firebase/views/authpages/user_form.dart';
import 'package:my_ecom_firebase/views/botttom_nav_controller/bottom_nav_controller.dart';
import 'package:my_ecom_firebase/views/drawer_screen.dart';
import 'package:my_ecom_firebase/views/main_home_screen.dart';
import 'package:my_ecom_firebase/views/onboarding_screen.dart';
import 'package:my_ecom_firebase/views/privacy_policy.dart';

import 'package:my_ecom_firebase/views/splash_screen.dart';

const String splash = '/splash-screen';
const String onboarding = '/onboarding-screesdfsfdn';
const String signupscreen = '/signup-screen';
const String signInScreen = '/signin-screen';
const String userForm = '/user-form';
const String privacyPolicy = '/privacy-policy';
const String mainHomeScreen = '/main-home-screen';
const String bottomNavController = '/bottom-nav-controller';
const String drawerScreen = '/drawer-screen';

List<GetPage> getPages = [
  GetPage(
    name: splash,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: onboarding,
    page: () => OnBoardingScreen(),
  ),
  GetPage(
    name: signupscreen,
    page: () => SignUpScreen(),
  ),
  GetPage(
    name: signInScreen,
    page: () => SignInScreen(),
  ),
  GetPage(
    name: userForm,
    page: () => UserForm(),
  ),
  GetPage(
    name: privacyPolicy,
    page: () => PrivacyPolicy(),
  ),
  GetPage(
    name: mainHomeScreen,
    page: () => MainHomeScreen(),
  ),
  GetPage(
    name: bottomNavController,
    page: () => BottomNavController(),
  ),
  GetPage(
    name: drawerScreen,
    page: () => DrawerScreen(),
  ),
];
