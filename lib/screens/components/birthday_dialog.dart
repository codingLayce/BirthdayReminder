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
  TextStyle labelStyle = TextStyle(
      fontFamily: "Roboto",
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Color.fromRGBO(0, 0, 0, 0.6));
  TextStyle style = TextStyle(
      fontFamily: "Roboto",
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Color.fromRGBO(0, 0, 0, 0.6));

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: Text("Nouvel anniversaire"),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        titlePadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 0,
        backgroundColor: AppColors.cloudsColor,
        children: [_content(context)]);
  }

  _content(context) {
    return Wrap(runSpacing: 5.0, children: [
      Flex(direction: Axis.horizontal, children: [
        Expanded(flex: 8, child: _getPersonLabel()),
        Expanded(flex: 1, child: SizedBox()),
        Expanded(flex: 16, child: _getPersonField())
      ]),
      Flex(direction: Axis.horizontal, children: [
        Expanded(flex: 8, child: _getDateLabel()),
        Expanded(flex: 1, child: SizedBox()),
        Expanded(flex: 16, child: _getDateField())
      ]),
      Row(children: [Expanded(child: _getErrorField())]),
      Row(children: [Expanded(child: _getRegisterButton())])
    ]);
  }

  _getPersonLabel() {
    return Container(
        height: 50,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(color: AppColors.concreteColor),
        child: Center(child: Text("Personne", style: labelStyle)));
  }

  _getDateLabel() {
    return Container(
        height: 50,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(color: AppColors.concreteColor),
        child: Center(child: Text("Date", style: labelStyle)));
  }

  _getDateField() {
    return InkWell(
        onTap: () {
          _selectDate(context);
        },
        child: Container(
            height: 50,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                border:
                    Border.all(color: AppColors.wetAsphaltColor, width: 2.0)),
            child: this.selectedDate == DateTime.fromMillisecondsSinceEpoch(0)
                ? Align(
                    child: Text("Aucune date", style: style),
                    alignment: Alignment.centerLeft)
                : Align(
                    child: Text(
                        "${this.selectedDate.day}/${this.selectedDate.month}/${this.selectedDate.year}",
                        style: style),
                    alignment: Alignment.centerLeft)));
  }

  _getErrorField() {
    return Text(error,
        textAlign: TextAlign.center,
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
                color: AppColors.peterRiverColor)));
  }

  _getPersonField() {
    return Container(
        height: 50,
        child: Center(
            child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                style: style,
                cursorColor: Colors.black,
                autofocus: false,
                cursorHeight: 20.0,
                cursorWidth: 1.0,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: -5, horizontal: 5),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(
                            color: AppColors.wetAsphaltColor, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(
                            color: AppColors.peterRiverColor, width: 2.0)),
                    hintText: "Personne"),
                controller: this.controller)));
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
                    primary: AppColors.peterRiverColor,
                    surface: AppColors.cloudsMColor[100]!,
                    onSurface: Color.fromRGBO(0, 0, 0, 0.6)),
                dialogBackgroundColor: Color.fromRGBO(243, 242, 239, 1.0)),
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
