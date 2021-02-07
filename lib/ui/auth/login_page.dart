import 'package:allam_market/core/viewmodels/auth_viewmodel.dart';
import 'package:allam_market/ui/auth/register_page.dart';
import 'package:allam_market/ui/widget/custom_button.dart';
import 'package:allam_market/ui/widget/custom_text.dart';
import 'package:allam_market/ui/widget/custom_text_field.dart';
import 'package:allam_market/ui/widget/cutsom_social.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class SignInPage extends GetWidget<AuthViewModel>{
  GlobalKey<FormState>_formkey=GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          right: 20,
          left: 20,
        ),
        child: Form(
          key:_formkey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Welcome,",
                    fontSize: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(RegisterView());
                    },
                    child: CustomText(
                      text: "Sign Up",
                      color: primaryColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: 'Sign in to Continue',
                fontSize: 14,
                color: Colors.grey,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                text: 'Email',
                hint: 'iamdavid@gmail.com',

                validator: (value) {
                  if (value == null) {
                    print("ERROR");
                  }
                },
                onSaved: (val){
                  controller.email=val;
                },
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextField(
                text: 'Password',
                hint: '**********',
                validator: (value) {
                  if (value == null) {
                    print('error');
                  }
                },
                onSaved: (val){
                  controller.password=val;
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                text: 'Forgot Password?',
                fontSize: 14,
                alignment: Alignment.topRight,
              ),
              SizedBox(
                height: 15,
              ),
              CustomButton(
                onPress: () {
                  _formkey.currentState.save();
                  if(_formkey.currentState.validate())
                   controller.signInWithEmail();
                },
                text: 'SIGN IN',
              ),
              SizedBox(
                height: 40,
              ),
              CustomText(
                text: '-OR-',
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 40,
              ),
              CustomButtonSocial(
                text: 'Sign In with Facebook',
                onPress: () {
                 controller.signInWithFacebook();
                },
                imageName: 'assets/images/facebook.png',
              ),
              SizedBox(
                height: 40,
              ),
              CustomButtonSocial(
                text: 'Sign In with Google',
                onPress: () {
                  controller.signInWithGoogle();
                },
                imageName: 'assets/images/google.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
