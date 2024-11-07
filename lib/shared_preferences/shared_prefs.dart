import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Future<void> saveName({required String name}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('userName', name);
  }

  static Future<void> clearData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('userName');
  }

  static Future<String?> getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? name = preferences.getString('userName');
    return name;
  }
}





// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPref {
//   static Future saveName({required String name}) async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     preferences.setString('userName', name);
//   }

//   static Future clearData() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     preferences.setString('userName', "");
//   }

//   static Future getName() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     String? name = preferences.getString('userName');
//     return name;
//   }
// }
