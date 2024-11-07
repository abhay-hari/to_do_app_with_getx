import 'package:hive/hive.dart';
import 'package:to_do_app/model/note_model.dart';

class NoteServices {
  static late Box<Note>? _noteBox;
  static Future<void> openBox() async {
    _noteBox = await Hive.openBox<Note>('notes');
  }

  static Future closeBox() async {
    await _noteBox!.close();
  }

  static Future addNote(Note note) async {
    if (_noteBox == null) {
      await openBox();
    }
    await _noteBox!.add(note);
  }

  static Future getNotes() async {
    if (_noteBox == null) {
      await openBox();
    }
    return _noteBox!.values.toList();
  }

  // static Future updateNote(int index, Note note) async {
  //   if (_noteBox == null) {
  //     await openBox();
  //   }
  //   await _noteBox!.putAt(index, note);
  // }

  static Future deleteNote(int index) async {
    if (_noteBox == null) {
      await openBox();
    }
    await _noteBox!.deleteAt(index);
  }
}
