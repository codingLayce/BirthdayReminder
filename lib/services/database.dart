import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:birthday_app/models/birthday.dart';

class Database {
  static final Database _instance = Database._internal();

  factory Database() {
    return _instance;
  }

  late var database;

  void init() async {
    WidgetsFlutterBinding.ensureInitialized();

    database = openDatabase(
        join(await getDatabasesPath(), 'birthdays_reminder.db'),
        version: 1, onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE birthday(person STRING PRIMARY KEY, day INTEGER, month INTEGER, year INTEGER)');
    });
  }

  Future<void> insertBirthday(Birthday birthday) async {
    final db = await database;

    await db.insert('birthday', birthday.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    print("INSERTED");
  }

  Future<List<Birthday>> birthdays() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('birthday');

    return List.generate(maps.length, (i) {
      DateTime date =
          DateTime.utc(maps[i]['year'], maps[i]['month'], maps[i]['day'])
              .toLocal();
      return Birthday(date: date, person: maps[i]['person']);
    });
  }

  Future<void> deleteBirthday(String person) async {
    final db = await database;

    await db.delete('birthday', where: 'person = ?', whereArgs: [person]);
  }

  Database._internal();
}
