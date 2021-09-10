import 'package:flutter/material.dart';
import 'package:birthday_app/common/colors.dart';

typedef void PostFormFunc(String person, DateTime date);

class BirthdayDialog extends StatefulWidget {
  final PostFormFunc callback;

  BirthdayDialog(this.callback);

  @override
  State createState() => _BirthdayDialog();
}

class _BirthdayDialog extends State<BirthdayDialog> {
  DateTime selectedDate = DateTime.fromMillisecondsSinceEpoch(0);
  TextEditingController controller = TextEditingController();
  var error = "";
  TextStyle style = TextStyle(
      fontFamily: "Roboto",
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: Text("Nouvel anniversaire"),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
        titlePadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 0,
        backgroundColor: AppColors.cloudsColor,
        children: [Center(child: _content(context))]);
  }

  _content(context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _getPersonField(),
          SizedBox(height: 10),
          _getDateField(),
          _getRegisterButton(),
          _getErrorField()
        ]));
  }

  _getDateField() {
    return InkWell(
        onTap: () {
          _selectDate(context);
        },
        child: Row(children: [
          Text("Date:", style: style),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black)),
                  child: this.selectedDate ==
                          DateTime.fromMillisecondsSinceEpoch(0)
                      ? Text("Aucune date",
                          style: style, textAlign: TextAlign.center)
                      : Text(
                          "${this.selectedDate.day}/${this.selectedDate.month}/${this.selectedDate.year}",
                          style: style,
                          textAlign: TextAlign.center)))
        ]));
  }

  _getErrorField() {
    return Text(error,
        style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.red));
  }

  _getRegisterButton() {
    return TextButton(
        onPressed: () {
          if (controller.value.text == "") {
            setState(() {
              error = "Personne vide";
            });
            return;
          }
          if (this.selectedDate == DateTime.fromMillisecondsSinceEpoch(0)) {
            setState(() {
              error = "Date vide";
            });
            return;
          }
          error = "";
          widget.callback(controller.value.text, this.selectedDate);
        },
        child: Text("Enregistrer",
            style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.turquoiseColor)));
  }

  _getPersonField() {
    return TextFormField(
        textAlignVertical: TextAlignVertical.center,
        style: style,
        cursorColor: Colors.black,
        autofocus: false,
        cursorHeight: 20.0,
        cursorWidth: 1.0,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide:
                    BorderSide(color: AppColors.wetAsphaltColor, width: 2.0)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide:
                    BorderSide(color: AppColors.peterRiverColor, width: 2.0)),
            hintText: "Personne"),
        controller: this.controller);
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1920),
        lastDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        helpText: "Sélectionnez un anniversaire !",
        cancelText: "ANNULER",
        confirmText: "CONFIRMER",
        locale: const Locale("fr", "FR"),
        builder: (context, child) {
          return Theme(
            data: ThemeData.dark().copyWith(
                colorScheme: ColorScheme.dark(
                    primary: AppColors.turquoiseColor,
                    surface: AppColors.cloudsMColor[100]!),
                dialogBackgroundColor: AppColors.asbestosColor),
            child: child!,
          );
        });

    if (selected != null && selected != this.selectedDate) {
      setState(() {
        this.selectedDate = selected;
      });
    }
  }
}
