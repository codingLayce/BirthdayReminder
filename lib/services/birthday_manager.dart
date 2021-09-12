import 'package:birthday_app/models/birthday.dart';
import 'package:birthday_app/services/storage.dart';

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

    _birthdays.add(Birthday(person: person, date: date));
    Storage().writeBirthdays(_birthdays);

    return true;
  }

  List<String> getPersons() {
    List<String> sortedPersons = [];
    int current = DateTime.now().month;

    do {
      _birthdays.forEach((birthday) {
        if (birthday.date.month == current) sortedPersons.add(birthday.person);
      });
      current = current + 1;
      if (current > 12) current = 1;
    } while (current != DateTime.now().month);

    return sortedPersons;
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
    _birthdays.removeWhere((birthday) => birthday.person == person);
    Storage().writeBirthdays(_birthdays);
  }

  BirthdayManager._internal();
}
