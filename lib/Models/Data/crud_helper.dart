import 'package:draggable/Models/Data/db_helper.dart';
import 'package:draggable/Models/score_model.dart';

class UserDBHelper {
  static String tablename = "User";

  // creates user & stores the data in database
  Future<void> createScore(ScoreModel user) async {
    var database = await DatabaseHelper.instance.database;
    await database!.insert(tablename, user.toMap());
  }

  //gets user from database
  Future<List<ScoreModel>> getScores() async {
    List<ScoreModel> users = [];

    var database = await DatabaseHelper.instance.database;

    List<Map<String, dynamic>> list =
        await database!.rawQuery("SELECT * FROM $tablename");

    for (var element in list) {
      var person = ScoreModel.fromMap(element);
      users.add(person);
    }
    return users;
  }

  //updates user info in database
  Future<void> updateUser(ScoreModel user) async {
    var database = await DatabaseHelper.instance.database;
    await database!.update(
      tablename,
      user.toMap(),
      where: "id = ?",
      whereArgs: [user.id],
    );
  }

  // delete user from daatbase
  Future<void> deleteUser(int id) async { 
    var database = await DatabaseHelper.instance.database;
    await database!.delete(
      tablename,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
