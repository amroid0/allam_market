 import 'package:allam_market/core/viewmodels/auth_viewmodel.dart';
import 'package:allam_market/core/viewmodels/home_view_model.dart';
import 'package:allam_market/core/viewmodels/splash_view_model.dart';
import 'package:get/get.dart';

class Injector extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => SplashViewmodel());
    Get.lazyPut(() => HomeViewModel());

  }

}