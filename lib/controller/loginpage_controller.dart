import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/shared_preferences/shared_prefs.dart';
import 'package:to_do_app/view/home_screen.dart';

class LogInPageController extends GetxController {
  TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  logIn() async {
    print("called");
    String name = nameController.text;
    print("Name is : $name");
    await SharedPref.saveName(name: name);
    await Get.offAll(() => ScreenHome());
    //  Get.offAll(ScreenHome());
    print("ended");
    // ! add this function
  }
}
