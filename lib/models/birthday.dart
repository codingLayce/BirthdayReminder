class Birthday {
  final String person;
  final DateTime date;

  Birthday({required this.person, required this.date});

  Map<String, dynamic> toMap() {
    return {
      'person': person,
      'day': date.day,
      'month': date.month,
      'year': date.year
    };
  }
}
