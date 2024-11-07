import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/model/note_model.dart';
import 'package:to_do_app/service/note_service.dart';

class NoteController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  get formkey => _formKey;
  final _noteList = <Note>[].obs;

  List<Note> get noteList => _noteList;

  TextEditingController? textEditingController;

  // final NoteServices _noteServices = NoteServices();

  @override
  void onInit() {
    // TODO: implement onInit
    textEditingController = TextEditingController();
    _loadNotes();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController!.clear();
  }

  Future<void> _loadNotes() async {
    _noteList.value = await NoteServices.getNotes();
  }

  void addNote() async {
    String text = textEditingController!.text;
    DateTime time = DateTime.now();
    _noteList.add(Note(time.day.toString(), text, time));
    textEditingController!.text = "";
    await NoteServices.addNote(Note(time.day.toString(), text, time));
    Get.back();
  }

  void deleteNote(int index, Note note) async {
    _noteList.remove(note);
    await NoteServices.deleteNote(index);
    Get.back();
  }
}






// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:to_do_app/model/note.dart';

// class NoteController extends GetxController {
//   final _noteList = <Note>[].obs;
//   List<Note> get noteList => _noteList;

//   TextEditingController? textEditingController;

//   @override
//   void onInit() {
//     super.onInit();
//     textEditingController = TextEditingController();
//     _loadNotes();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     textEditingController!.clear();
//     Hive.close();
//   }

//   Future<void> _loadNotes() async {
//     final notesBox = await Hive.openBox<Note>('notes');
//     _noteList.value = notesBox.values.toList();
//   }

//   void addNote() {
//     String text = textEditingController!.text;
//     DateTime time = DateTime.now();
//     Note note = Note(time.day.toString(), text, time);
//     _saveNote(note);
//     textEditingController!.text = "";
//     Get.back();
//   }

//   void deleteNote(Note note) {
//     _deleteNote(note);
//     Get.back();
//   }

//   Future<void> _saveNote(Note note) async {
//     final notesBox = await Hive.openBox<Note>('notes');
//     await notesBox.add(note);
//     _noteList.add(note);
//   }

//   Future<void> _deleteNote(Note note) async {
//     final notesBox = await Hive.openBox<Note>('notes');
//     await notesBox.delete(note.hashCode);
//     _noteList.remove(note);
//   }
// }

