import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_ecom_firebase/const/app_colors.dart';
import 'package:my_ecom_firebase/ui/route/route.dart';
import 'package:my_ecom_firebase/views/authpages/sign_up_screen.dart';

import 'package:my_ecom_firebase/views/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    name: "My Ecommers",
    options: FirebaseOptions(
      apiKey: "AIzaSyCHMO6F_JBPzbNM-JzSGaUTcjb11uUYjPQ",
      appId: "1:6275220746:android:739dcd0f1120051d2426f3",
      messagingSenderId: "6275220746",
      projectId: "forex-update-699e7",
    ),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        initialRoute: signupscreen,
        getPages: getPages,
        home: SignUpScreen());
  }
}
