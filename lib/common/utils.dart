class Utils {
  static int currentAge(DateTime birthday) {
    DateTime today = DateTime.now();

    int age = today.year - birthday.year;

    if (birthday.isAfter(today)) --age;

    return age;
  }

  static int daysAwayFromToday(DateTime birthday) {
    DateTime today = DateTime.now();
    DateTime date = nextBirthdayDate(birthday);
    return date.difference(today).inDays;
  }

  static DateTime nextBirthdayDate(DateTime birthday) {
    DateTime today = DateTime.now();
    DateTime next = DateTime(today.year, birthday.month, birthday.day);

    if (today.month > birthday.month ||
        (today.month == birthday.month && today.day > birthday.day))
      next = DateTime(today.year + 1, birthday.month, birthday.day);

    if (today.month == birthday.month && today.day == birthday.day)
      next = DateTime.now()
          .add(const Duration(seconds: 10)); // TODO change to minutes: 1

    return next;
  }

  static int nextAge(DateTime birthday) {
    return currentAge(birthday) + 1;
  }

  static String getMonthName(int month) {
    switch (month) {
      case 1:
        return "Janvier";
      case 2:
        return "Février";
      case 3:
        return "Mars";
      case 4:
        return "Avril";
      case 5:
        return "Mai";
      case 6:
        return "Juin";
      case 7:
        return "Juillet";
      case 8:
        return "Août";
      case 9:
        return "Septembre";
      case 10:
        return "Octobre";
      case 11:
        return "Novembre";
      case 12:
        return "Décembre";
      default:
        return "Inconnu";
    }
  }
}
