import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_ecom_firebase/const/app_colors.dart';
import 'package:my_ecom_firebase/ui/route/route.dart';
import 'package:my_ecom_firebase/views/authpages/sign_up_screen.dart';
import 'package:my_ecom_firebase/views/authpages/user_form.dart';
import 'package:my_ecom_firebase/views/homepage.dart';
import 'package:my_ecom_firebase/views/sign_in.dart';
import 'package:my_ecom_firebase/views/sign_up.dart';
import 'package:my_ecom_firebase/views/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme.apply(),
          ),
          scaffoldBackgroundColor: AppColors.scaffoldColor,
        ),
        initialRoute: userForm,
        getPages: getPages,
        home: UserForm());
  }
}
