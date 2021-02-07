import 'package:allam_market/ui/cart_page.dart';
import 'file:///D:/my%20work/allam_market/lib/ui/home_page.dart';
import 'package:allam_market/ui/proifle_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewmodel extends GetxController{
  int _selectedTabIndex=0;
  int get SelectedTab=>_selectedTabIndex;
  Widget currentScreen = HomeView();

  void changeSelectedValue(int selectedValue) {
    _selectedTabIndex = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          currentScreen = HomeView();
          break;
        }
      case 1:
        {
          currentScreen = CartView();
          break;
        }
      case 2:
        {
          currentScreen = ProfileView();
          break;
        }
    }
    update();
  }
}
