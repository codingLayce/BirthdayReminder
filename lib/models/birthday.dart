class Birthday {
  final String person;
  final DateTime date;

  Birthday({required this.person, required this.date});

  factory Birthday.fromJson(dynamic json) {
    return Birthday(
        person: json['person'] as String, date: DateTime.parse(json['date']));
  }

  Map toJson() {
    return {'person': person, 'date': date.toIso8601String()};
  }
}
