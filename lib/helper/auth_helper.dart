import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'package:get_storage/get_storage.dart';
import 'package:my_ecom_firebase/views/homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:my_ecom_firebase/views/sign_up.dart';

class AuthHelper {
  final box = GetStorage();
  // Sign up ..........................Sign up method.................//
  Future signUp(email, password, context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      var authCredential = userCredential.user;
      print(authCredential);

      if (authCredential!.uid.isNotEmpty) {
        box.write('id', authCredential.uid);

        Navigator.push(context, CupertinoPageRoute(builder: (_) => Homepage()));
      } else {
        print("Sign up failed");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // print('The account already exists for that email.');

        Fluttertoast.showToast(
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16,
            msg: "This email already in used");
      }
    } catch (e) {
      print(e);
    }
  }

  // Sign in Method............................// Sign in.........................//

  Future singIn(email, password, context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      var authCredential = userCredential.user;
      print(authCredential);

      if (authCredential!.uid.isNotEmpty) {
        Navigator.push(
            context, CupertinoPageRoute(builder: (_) => SignUpScreen()));
      } else {
        print("Sign up failed");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
