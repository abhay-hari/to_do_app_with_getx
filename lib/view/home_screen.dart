import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controller/note_controller.dart';
import 'package:to_do_app/view/add_note.dart';
import 'package:to_do_app/view/details_page.dart';
import 'package:to_do_app/widget/drawer.dart';
import 'package:to_do_app/widget/note_tile.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  final NoteController controller = Get.put(NoteController());
  @override
  Widget build(BuildContext context) {
    TextTheme text = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomDrawer(),
      floatingActionButton: InkWell(
        onTap: () {
          Get.to(() => ScreenAddNote());
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.red,
          ),
          child: const Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => (controller.noteList.isEmpty)
              ? Center(
                  child: Text(
                    "No Notes found",
                    style: text.headlineSmall,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.separated(
                    itemCount: controller.noteList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(
                            () => NoteDetails(
                              date: controller.noteList[index].time,
                              note: controller.noteList[index].description,
                            ),
                          );
                          // Get.to(NoteDetails(
                          //   date: controller.noteList[index].time,
                          //   note: controller.noteList[index].description,
                          // ));
                          // Navigator.of(context).pushReplacement(newRoute)
                        },
                        child: NoteTileWidget(
                          size: size,
                          text: text,
                          index: index,
                          onPress: () {
                            openDeleteBox(context, index);
                            // controller.deleteNote(controller.noteList[index]);
                          },
                          time: controller.noteList[index].date,
                          description: controller.noteList[index].description,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 5,
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }

  openDeleteBox(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Are you sure you want to delete?',
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
                    controller.deleteNote(index, controller.noteList[index]);
                  },
                  child: Container(
                    height: 45,
                    width: 110,
                    color: const Color(0xFF9a4321),
                    child: const Center(
                      child: Text(
                        'Delete',
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
