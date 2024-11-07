import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controller/note_controller.dart';

import '../model/custom_border_style.dart';

class ScreenAddNote extends StatelessWidget {
  ScreenAddNote({super.key});
  final NoteController controller = Get.put(NoteController());
  @override
  Widget build(BuildContext context) {
    TextTheme text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: controller.formkey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const Spacer(
                  flex: 3,
                ),
                Text(
                  "Add new Note",
                  style: text.headlineSmall,
                ),
                const Spacer(
                  flex: 1,
                ),
                TextFormField(
                  controller: controller.textEditingController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter your note",
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    border: MyCustomBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please add your note';
                    }
                  },
                ),
                const SizedBox(height: 25),
                InkWell(
                  onTap: () {
                    if (controller.formkey.currentState!.validate()) {
                      print("validate");
                      controller.addNote();
                    } else {
                      print("not validated");
                    }
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width / 2,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "Save Note",
                        style: text.labelLarge!.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 3,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
