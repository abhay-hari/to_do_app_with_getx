import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:to_do_app/shared_preferences/shared_prefs.dart';
import 'package:to_do_app/view/home_screen.dart';
import 'package:to_do_app/view/login.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    timeforLoading();
  }

  void timeforLoading() async {
    String? name = await SharedPref.getName();
    await Future.delayed(const Duration(seconds: 3));
    update();

    if (kDebugMode) print("name is : ${name ?? "Name is null"}");
    name != null && name.isNotEmpty
        ? Get.offAll(() => ScreenHome())
        : Get.offAll(() => ScreenLogInPage());
  }
}
