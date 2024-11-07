import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NoteDetails extends StatelessWidget {
  DateTime date;
  String note;
  NoteDetails({super.key, required this.date, required this.note});
  String formatTime(DateTime inputTime) {
    String formattedTime = DateFormat('hh:mm a').format(inputTime);
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    TextTheme text = Theme.of(context).textTheme;
    String displayDate = "${date.day}-${date.month}-${date.year}";
    String formattedTime = formatTime(date);
    print("Date : " + displayDate);
    print("Time : " + formattedTime);
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Colors.blue,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(displayDate)),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(formattedTime),
                      ),
                    ],
                  ),
                ),
                Text(
                  note,
                  style: TextStyle(),
                  textAlign: TextAlign.justify,
                ),
                Container(
                  height: 45,
                  width: 180,
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        color: Colors.grey[300],
                        child: Center(
                          child: Text("B"),
                        ),
                      ),
                      Container(
                        width: 60,
                        color: Colors.grey[300],
                        child: Center(
                          child: Text("I"),
                        ),
                      ),
                      Container(
                        width: 60,
                        color: Colors.grey[300],
                        child: Center(
                          child: Text("U"),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("Start");
                    Get.back();
                    print("End");
                  },
                  child: Container(
                    height: 45,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Back",
                        style: text.labelLarge!.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 120,
                ),
                Container(
                  height: 120,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
