import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_ecom_firebase/ui/route/route.dart';

class UsersInfo {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  sendFormDataToDB(String name, int phone, String address, String dob,
      String gender, RxBool obs) async {
    try {
      CollectionReference _course =
          FirebaseFirestore.instance.collection("users-form-data");
      _course.doc(_auth.currentUser!.email).set({
        'name': name,
        'phone': phone,
        'address': address,
        'dob': dob,
        'gender': gender,
      }).whenComplete(
        () {
          Fluttertoast.showToast(msg: "Added Successfully");
          Get.toNamed(privacyPolicy);
        },
      );
    } catch (e) {
      Fluttertoast.showToast(msg: "error: $e");
    }
  }
}
