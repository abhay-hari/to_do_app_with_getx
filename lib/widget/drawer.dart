import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controller/drawer_controller.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  final GetXDrawerController controller = Get.put(GetXDrawerController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Text(controller.name),
          ),
          InkWell(
            onTap: () => openAlertDialog(context),
            child: const SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 40,
                    child: Center(
                      child: Icon(Icons.logout),
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 140,
                    child: Center(child: Text("Logout")),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 40,
                    child: Center(
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  openAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log Out?'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Are you sure you want to log out?',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 45,
                    width: 110,
                    color: Colors.grey,
                    child: const Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.logOut();
                  },
                  child: Container(
                    height: 45,
                    width: 110,
                    color: const Color(0xFF9a4321),
                    child: const Center(
                      child: Text(
                        'Log out',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
