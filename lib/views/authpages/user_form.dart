import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:my_ecom_firebase/ui/route/route.dart';
import 'package:my_ecom_firebase/ui/styles/styles.dart';
import 'package:my_ecom_firebase/ui/widgets/violetButton.dart';

class UserForm extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  Rx<TextEditingController> _dobController = TextEditingController().obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;

  _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
        context: context,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2300));

    if (selected != null && selected != selectedDate) {
      _dobController.value.text =
          "${selected.day} - ${selected.month}-${selected.year}";
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
              Obx(() => TextFormField(
                    controller: _dobController.value,
                    readOnly: true,
                    decoration: InputDecoration(
                        hintText: "date of birth",
                        suffixIcon: IconButton(
                            onPressed: () => _selectDate(context),
                            icon: Icon(
                              Icons.calendar_month,
                            ))),
                  )),
              SizedBox(
                height: screenHeight * 0.100,
              ),
              VioletButton("Create New Account"),
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
