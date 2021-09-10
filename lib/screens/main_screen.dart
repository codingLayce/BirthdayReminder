import 'package:birthday_app/common/colors.dart';
import 'package:birthday_app/common/utils.dart';
import 'package:birthday_app/models/birthday.dart';
import 'package:birthday_app/screens/components/birthday_card.dart';
import 'package:birthday_app/screens/components/birthday_dialog.dart';
import 'package:birthday_app/services/birthday_manager.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  DateTime selectedDate = DateTime.fromMillisecondsSinceEpoch(0);
  bool loading = true;

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    await BirthdayManager().loadBirthdays();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.wetAsphaltMColor,
        appBar: AppBar(title: const Text("Rappel d'anniversaire")),
        body: Container(
            width: double.infinity,
            margin: EdgeInsets.all(15),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _getBirthdayWidgets()))),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.peterRiverColor,
          foregroundColor: Colors.white,
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return BirthdayDialog((person, date) {
                  BirthdayManager().registerBirthday(person, date);
                  setState(() {});
                  Navigator.pop(context);
                });
              }),
          tooltip: 'Enregistrer un anniversaire',
          child: const Icon(Icons.add),
        ));
  }

  List<Widget> _getBirthdayWidgets() {
    List<Widget> widgets = [];
    List<String> persons = BirthdayManager().getPersons();
    int previousMonth = -1;
    int index = 0;

    persons.forEach((person) {
      Birthday birthday = BirthdayManager().getBirthday(person);

      if (birthday.date.month != previousMonth) {
        if (previousMonth != -1)
          widgets.add(Divider(thickness: 2, color: Colors.grey));
        widgets.add(Center(
            child: Text(Utils.getMonthName(birthday.date.month),
                style: TextStyle(
                    fontFamily: "Roboto", fontSize: 14, color: Colors.grey))));
      }

      widgets.add(BirthdayCard(person, birthday.date,
          index % 2 == 0 ? AppColors.concreteColor : AppColors.asbestosColor,
          (person) {
        BirthdayManager().removeBirthday(person);
        setState(() {});
      }));

      previousMonth = birthday.date.month;
      ++index;
    });

    return widgets;
  }
}
