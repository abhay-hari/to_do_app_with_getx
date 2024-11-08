import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controller/loginpage_controller.dart';

class ScreenLogInPage extends StatelessWidget {
  ScreenLogInPage({super.key});
  final LogInPageController controller = Get.put(LogInPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 400,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: FadeInUp(
                          duration: const Duration(seconds: 1),
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/light-1.png'))),
                          )),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: FadeInUp(
                          duration: const Duration(milliseconds: 1200),
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/light-2.png'))),
                          )),
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: FadeInUp(
                          duration: const Duration(milliseconds: 1300),
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/clock.png'))),
                          )),
                    ),
                    Positioned(
                      child: FadeInUp(
                          duration: const Duration(milliseconds: 1600),
                          child: Container(
                            margin: const EdgeInsets.only(top: 50),
                            child: const Center(
                              child: Text(
                                "Note Hub",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    FadeInUp(
                        duration: const Duration(milliseconds: 1800),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          //     borderRadius: BorderRadius.circular(10),
                          //     border: Border.all(
                          //         color:
                          //             const Color.fromRGBO(143, 148, 251, 1)),
                          //     boxShadow: const [
                          //       BoxShadow(
                          //           color: Color.fromRGBO(143, 148, 251, .2),
                          //           blurRadius: 20.0,
                          //           offset: Offset(0, 10))
                          //     ]
                          //     ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  padding: const EdgeInsets.all(8.0),
                                  // decoration: const BoxDecoration(
                                  //   border: Border(
                                  //     bottom: BorderSide(
                                  //       color: Color.fromRGBO(143, 148, 251, 0),
                                  //     ),
                                  //   ),
                                  // ),
                                  child: TextFormField(
                                    // key: controller.formKey,
                                    // style: TextStyle(fontSize: 6),
                                    controller: controller.nameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please fill in the name field';
                                      } else if (value
                                          .contains(RegExp(r'[^\w\s]'))) {
                                        return 'Invalid name format';
                                      } else if (RegExp(r'[0-9]')
                                          .hasMatch(value)) {
                                        return 'Invalid name format';
                                      }

                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Enter your user name",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[700]),
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 1,
                                          color:
                                              Color.fromRGBO(143, 148, 251, 0),
                                        ),
                                      ),
                                    ),
                                  )
                                  //   InputDecoration(
                                  //       border: InputBorder.none,
                                  // hintText: "Enter your user name",
                                  // hintStyle:
                                  //     TextStyle(color: Colors.grey[700])),
                                  // ),
                                  ),
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    FadeInUp(
                        duration: const Duration(milliseconds: 1900),
                        child: InkWell(
                          onTap: () {
                            print("hai");
                            if (controller.formKey.currentState != null &&
                                controller.formKey.currentState!.validate()) {
                              print("validated");
                              controller.logIn();
                            }
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ])),
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 70,
                    ),
                    // FadeInUp(
                    //     duration: const Duration(milliseconds: 2000),
                    //     child: const Text(
                    //       "Forgot Password?",
                    //       style: TextStyle(
                    //           color: Color.fromRGBO(143, 148, 251, 1)),
                    //     )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
