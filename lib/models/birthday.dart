import 'package:birthday_app/common/utils.dart';

class Birthday {
  final int id;
  final String person;
  final DateTime date;

  Birthday({required this.person, required this.date, required this.id});

  factory Birthday.fromJson(dynamic json) {
    return Birthday(
        id: json['id'],
        person: json['person'] as String,
        date: DateTime.parse(json['date']));
  }

  Map toJson() {
    return {'id': id, 'person': person, 'date': date.toIso8601String()};
  }

  int compareTo(Birthday other) {
    int a = Utils.daysAwayFromToday(this.date);
    int b = Utils.daysAwayFromToday(other.date);

    return a.compareTo(b);
  }

  @override
  String toString() {
    return "$id $person ${date.toIso8601String()}";
  }
}
