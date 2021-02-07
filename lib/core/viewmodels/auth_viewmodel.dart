import 'package:allam_market/core/services/repositry.dart';
import 'package:allam_market/models/User.dart';
import 'file:///D:/my%20work/allam_market/lib/ui/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController{
GoogleSignIn _googleSignIn=GoogleSignIn(scopes: ['email']);
FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
FacebookLogin _facebookLogin=FacebookLogin();
String email,password,name;
Rx<User>_user=Rx<User>();
String get user=>_user.value?.email;
  @override
  void onInit() {
 _user.bindStream(_firebaseAuth.authStateChanges());
  }

  @override
  void onClose() {

  }

  @override
  void onReady() {

  }
  void signInWithGoogle()async{
  GoogleSignInAccount googleSignInAccount=await  _googleSignIn.signIn();
  GoogleSignInAuthentication authentication=await googleSignInAccount.authentication;
  AuthCredential credential=GoogleAuthProvider.credential(idToken: authentication.idToken, accessToken: authentication.accessToken);
  _firebaseAuth.signInWithCredential(credential).then((value) => onSaveUser(value));;
  Get.offAll(HomeView());

  }

void signInWithFacebook()async{
  FacebookLoginResult result=  await _facebookLogin.logIn(['email']);
  if(result.status==FacebookLoginStatus.loggedIn){
  AuthCredential credential= FacebookAuthProvider.credential(result.accessToken.token);
  _firebaseAuth.signInWithCredential(credential).then((value) => onSaveUser(value));
  Get.offAll(HomeView());

  }

}

void signInWithEmail()async{
  try {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password).then((value) => onSaveUser(value));;
        Get.offAll(HomeView());
  }catch(e){
    Get.snackbar('error', e.message,backgroundColor: Colors.red,snackPosition: SnackPosition.BOTTOM,colorText: Colors.white);
  }
}
void createAccount()async{
  try {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password).then((value) => onSaveUser(value));
    Get.offAll(HomeView());
  }catch(e){
    Get.snackbar('error', e.message,backgroundColor: Colors.red,snackPosition: SnackPosition.BOTTOM,colorText: Colors.white);
  }
}
void onSaveUser(UserCredential user)
{
  UserRepo().saveUser(UserModel(userId: user.user.uid,email:user.user.email,name: name==null?user.user.displayName:name,pic: ''));
}

}