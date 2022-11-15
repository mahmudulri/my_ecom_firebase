import 'package:get/get.dart';
import 'package:my_ecom_firebase/views/authpages/sign_up_screen.dart';
import 'package:my_ecom_firebase/views/onboarding_screen.dart';
import 'package:my_ecom_firebase/views/splash_screen.dart';

const String splash = '/splash-screen';
const String onboarding = '/onboarding-screesdfsfdn';
const String signupscreen = '/signup-screen';

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
];
