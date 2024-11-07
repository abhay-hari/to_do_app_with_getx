import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controller/splash_screen_controller.dart';
import 'package:animate_do/animate_do.dart';

class ScreenSplashScreen extends StatelessWidget {
  ScreenSplashScreen({super.key});
  final SplashScreenController controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInUp(
              duration: const Duration(milliseconds: 1300),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: const BoxDecoration(),
                child: Image.asset("assets/logo/logo.png"),
              ),
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 1600),
              child: Container(
                margin: const EdgeInsets.only(top: 50),
                child: const Center(
                  child: Text(
                    "Note Hub",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
