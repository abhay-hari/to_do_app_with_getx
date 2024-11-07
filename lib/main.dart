import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/model/note_model.dart';
import 'package:to_do_app/view/splash_screen.dart';
import 'service/note_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(NoteAdapter());
  await Hive.initFlutter();
  await NoteServices.openBox();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: ScreenSplashScreen(),
    );
  }
}




// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:to_do_app/view/splash_screen.dart';

// import 'model/note.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final appDocDir = await getApplicationDocumentsDirectory();
//   Hive.init(appDocDir.path);
//   Hive.registerAdapter(NoteAdapter());
//   runApp(const MyApp());
// }

// Future<Directory> getApplicationDocumentsDirectory() async {
//   return await getApplicationDocumentsDirectory();
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.indigo,
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Colors.deepPurple,
//         ),
//         useMaterial3: true,
//       ),
//       home: ScreenSplashScreen(),
//     );
//   }
// }
