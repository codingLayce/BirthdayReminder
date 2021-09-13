import 'package:birthday_app/models/birthday.dart';
import 'package:birthday_app/services/storage.dart';
import 'package:birthday_app/services/notifications.dart';

class BirthdayManager {
  static final BirthdayManager _instance = BirthdayManager._internal();

  factory BirthdayManager() {
    return _instance;
  }

  List<Birthday> _birthdays = [];

  Future<bool> loadBirthdays() async {
    _birthdays = await Storage().readBirthdays();
    return Future.value(true);
  }

  bool registerBirthday(String person, DateTime date) {
    if (exists(person)) return false;

    var birthday = Birthday(id: _getNextID(), person: person, date: date);

    _birthdays.add(birthday);
    Storage().writeBirthdays(_birthdays);

    Notifications.scheduleBirthdayNotification(birthday);

    return true;
  }

  List<String> getPersons() {
    _birthdays.sort((a, b) => a.compareTo(b));

    return _birthdays.map((e) => e.person).toList();
  }

  bool exists(String person) {
    bool toReturn = false;

    _birthdays.forEach((element) {
      if (element.person == person) toReturn = true;
    });

    return toReturn;
  }

  Birthday getBirthday(String person) {
    return _birthdays.firstWhere((birthday) => birthday.person == person);
  }

  void removeBirthday(String person) {
    Notifications.removeNotification(getBirthday(person).id);
    _birthdays.removeWhere((birthday) => birthday.person == person);
    Storage().writeBirthdays(_birthdays);
  }

  int _getNextID() {
    int id = -1;

    _birthdays.forEach((birthday) {
      if (birthday.id > id) id = birthday.id;
    });

    return id + 1;
  }

  BirthdayManager._internal();
}
