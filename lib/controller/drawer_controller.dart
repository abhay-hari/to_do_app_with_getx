import 'package:get/get.dart';
import 'package:to_do_app/shared_preferences/shared_prefs.dart';
import 'package:to_do_app/view/login.dart';

class GetXDrawerController extends GetxController {
  String name = "";

  @override
  void onInit() {
    getName();
    super.onInit();
  }

  Future<void> getName() async {
    name = (await SharedPref.getName()) ?? "";
    update();
  }

  Future<void> logOut() async {
    await SharedPref.clearData();
    Get.offAll(() => ScreenLogInPage());
  }
}






// import 'package:get/get.dart';
// import 'package:to_do_app/shared_preferences/shared_prefs.dart';
// import 'package:to_do_app/view/login.dart';
// import '../view/splash_screen.dart';

// class GetXDrawerController extends GetxController {
//   String name = "";
//   getName() async {
//     name = await SharedPref.getName();
//   }

//   logOut() async {
//     await SharedPref.clearData();
//     Get.offAll(() => ScreenSplashScreen());
//   }

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     getName();
//     super.onInit();
//   }
// }
