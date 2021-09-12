class Birthday {
  int id;
  final String person;
  final DateTime date;

  Birthday({required this.person, required this.date, this.id = -1});

  void setID(int id) {
    this.id = id;
  }

  factory Birthday.fromJson(dynamic json) {
    return Birthday(
        id: json['id'],
        person: json['person'] as String,
        date: DateTime.parse(json['date']));
  }

  Map toJson() {
    return {'id': id, 'person': person, 'date': date.toIso8601String()};
  }
}
