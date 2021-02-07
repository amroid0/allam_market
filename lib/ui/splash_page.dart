import 'package:allam_market/core/viewmodels/auth_viewmodel.dart';
import 'package:allam_market/core/viewmodels/splash_view_model.dart';
import 'package:allam_market/ui/auth/login_page.dart';
import 'file:///D:/my%20work/allam_market/lib/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {

   return  Obx((){
    return  Get.find<AuthViewModel>().user==null?SignInPage():GetBuilder<SplashViewmodel>(
      builder: (controller) => Scaffold(
        body: controller.currentScreen,
        bottomNavigationBar: GetBuilder<SplashViewmodel>(
          init: SplashViewmodel(),
          builder: (controller){
            return  BottomNavigationBar(
              elevation: 0,
              currentIndex: controller.SelectedTab,
              onTap: (index) {
                controller.changeSelectedValue(index);
              },

              items: [
                BottomNavigationBarItem(icon:
                Padding(padding: EdgeInsets.only(top: 20),
                  child: Image.asset('assets/images/explore.png',width: 20, fit: BoxFit.contain,
                  ),)
                    ,activeIcon: Text('Explore'),label: ''),
                BottomNavigationBarItem(icon:
                Padding(padding: EdgeInsets.only(top: 20),
                  child: Image.asset('assets/images/cart.png',width: 20, fit: BoxFit.contain,
                  ),)
                    ,activeIcon: Text('Cart'),label: ''),
                BottomNavigationBarItem(icon:
                Padding(padding: EdgeInsets.only(top: 20),
                  child: Image.asset('assets/images/profile.png',width: 20, fit: BoxFit.contain,
                  ),)
                    ,activeIcon: Text('Profile'),label: ''),

              ],
            );
          },
        ),
      ),
    );
    });
  }
}
