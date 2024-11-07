import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(
  typeId: 1,
)
class Note {
  @HiveField(0)
  String date;
  @HiveField(1)
  String description;
  @HiveField(2)
  DateTime time;
  Note(this.date, this.description, this.time);
  // Note.fromJson(Map<String, dynamic> json)
  //     : date = json['date'],
  //       description = json['description'],
  //       time = DateTime.parse(json['time']);

  // Map<String, dynamic> toJson() => {
  //       'date': date,
  //       'description': description,
  //       'time': time.toIso8601String(),
  //     };
}
// class Note {
//   String date;
//   String description;
//   DateTime time;
//   Note(this.date, this.description, this.time);
// }