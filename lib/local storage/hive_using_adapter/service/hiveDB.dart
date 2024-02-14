import 'package:hive/hive.dart';
import '../model/users.dart';

class HiveDB {

  // HiveDB.constr();
  // static HiveDB instance = HiveDB.constr();
  //
  // factory HiveDB() {
  //   return instance;
  // }
static Future<void> addUser(Users user) async{
  final db = await Hive.openBox<Users>('userdata');
  db.put(user.id, user);  // to store userdata to db

}

 static Future<List<Users>> getallusers() async{
   final db = await Hive.openBox<Users>('userdata');
   return db.values.toList();
 }
}
