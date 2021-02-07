import 'package:allam_market/core/viewmodels/auth_viewmodel.dart';
import 'package:allam_market/ui/auth/login_page.dart';
import 'package:allam_market/ui/widget/custom_button.dart';
import 'package:allam_market/ui/widget/custom_text.dart';
import 'package:allam_market/ui/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Get.off(SignInPage());
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          right: 20,
          left: 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomText(
                text: "Sign Up,",
                fontSize: 30,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                text: 'Name',
                hint: 'amr',
                onSaved: (value) {
                  controller.name = value;
                },
                validator: (value) {
                  if (value == null) {
                    print("ERROR");
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                text: 'Email',
                hint: 'iamdavid@gmail.com',
                onSaved: (value) {
                  controller.email = value;
                },
                validator: (value) {
                  if (value == null) {
                    print("ERROR");
                  }
                },
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextField(
                text: 'Password',
                hint: '**********',
                onSaved: (value) {
                  controller.password = value;
                },
                validator: (value) {
                  if (value == null) {
                    print('error');
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              CustomButton(
                onPress: () {
                  _formKey.currentState.save();

                  if (_formKey.currentState.validate()) {
                    controller.createAccount();
                  }
                },
                text: 'SIGN Up',
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}