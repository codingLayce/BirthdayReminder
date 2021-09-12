import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:birthday_app/models/birthday.dart';
import 'package:path_provider/path_provider.dart';

const FILE = "birthdays.txt";

class Storage {
  static final Storage _instance = Storage._internal();

  factory Storage() {
    return _instance;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$FILE');
  }

  Future<File> writeBirthdays(List<Birthday> birthdays) async {
    final file = await _localFile;

    return file.writeAsString(json.encode(birthdays));
  }

  Future<List<Birthday>> readBirthdays() async {
    try {
      final file = await _localFile;

      final content = await file.readAsString();
      var decoded = jsonDecode(content) as List;

      return decoded.map((birthday) => Birthday.fromJson(birthday)).toList();
    } catch (e) {
      return [];
    }
  }

  String storableBirthdays(List<Birthday> birthdays) {
    return jsonEncode(birthdays);
  }

  Storage._internal();
}
