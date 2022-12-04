import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_ecom_firebase/business_logic/form.dart';
import 'package:my_ecom_firebase/const/app_colors.dart';
import 'package:my_ecom_firebase/ui/route/route.dart';
import 'package:my_ecom_firebase/ui/styles/styles.dart';
import 'package:my_ecom_firebase/ui/widgets/violetButton.dart';
import 'package:toggle_switch/toggle_switch.dart';

class UserForm extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  Rx<TextEditingController> _dobController = TextEditingController().obs;

  String? dob;
  String gender = "Male";
  Rx<DateTime> selectedDate = DateTime.now().obs;

  _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
        context: context,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2300));

    if (selected != null && selected != selectedDate) {
      dob = "${selected.day} - ${selected.month}-${selected.year}";
      _dobController.value.text = dob!;

      // dob = _dobController.value.text.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.050,
              ),
              Text(
                "Tell Us More About You",
                style: TextStyle(
                  color: Color(0xff8000FF),
                  fontSize: screenWidth * 0.060,
                ),
              ),
              Text("Create your account and start your journey"),
              SizedBox(
                height: 60,
              ),
              mytextfield(_nameController, TextInputType.text, "Name"),
              mytextfield(
                  _phoneController, TextInputType.number, "Phone Number"),
              mytextfield(_addressController, TextInputType.text, "Address"),
              Obx(
                () => TextFormField(
                  controller: _dobController.value,
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: "date of birth",
                      suffixIcon: IconButton(
                          onPressed: () => _selectDate(context),
                          icon: Icon(
                            Icons.calendar_month,
                          ))),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.040,
              ),
              // Here, default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
              ToggleSwitch(
                minWidth: 90.0,
                fontSize: 16.0,
                initialLabelIndex: 1,
                activeBgColor: [AppColors.violetColor],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.grey[900],
                totalSwitches: 2,
                labels: [
                  'Male',
                  'Female',
                ],
                onToggle: (index) {
                  if (index == 0) {
                    gender = "Male";
                  } else {
                    gender = "Female";
                  }

                  print('switched to: $index');
                },
              ),
              SizedBox(
                height: screenHeight * 0.050,
              ),

              VioletButton(
                  "Submit",
                  () => UsersInfo().sendFormDataToDB(
                        _nameController.text,
                        int.parse(_phoneController.text.toString()),
                        _addressController.text,
                        dob!,
                        gender,
                        false.obs,
                      ),
                  false.obs),

              // ElevatedButton(
              //     onPressed: () {
              //       Get.toNamed(privacyPolicy);
              //       // UsersInfo().sendFormDataToDB(
              //       //     _nameController.text,
              //       //     int.parse(_phoneController.text),
              //       //     _addressController.text,
              //       //     dob!,
              //       //     gender,
              //       //     false.obs);
              //     },
              //     child: Text("Submit")),

              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Registered ?"),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: () {
                        Get.toNamed(signInScreen);
                      },
                      child: Text(
                        "Log in Now",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget mytextfield(controller, inputType, hint) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      decoration: AppStyles().textFieldDecoration(hint),
    );
  }
}
