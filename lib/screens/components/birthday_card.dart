import 'package:flutter/material.dart';
import 'package:birthday_app/common/utils.dart';
import 'package:birthday_app/common/colors.dart';

typedef void OnRemoveFunc(String person);

class BirthdayCard extends StatefulWidget {
  final String person;
  final DateTime date;
  final Color color;
  final OnRemoveFunc callback;

  BirthdayCard(this.person, this.date, this.color, this.callback);

  @override
  State createState() => _BirthdayCard();
}

class _BirthdayCard extends State<BirthdayCard> {
  bool extended = false;
  TextStyle styleDate = TextStyle(
      fontFamily: "Roboto",
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white);

  TextStyle styleMore = TextStyle(
      fontFamily: "Roboto",
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.deepPurple);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => setState(() {
              this.extended = !this.extended;
            }),
        onLongPress: () => {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return _getConfirmDeleteDialog(context);
                  })
            },
        child: this.extended ? _buildExtended() : _buildNotExtended());
  }

  Widget _buildNotExtended() {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
        decoration: BoxDecoration(color: widget.color),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_getPerson(), Divider(), _getDate()]));
  }

  Widget _buildExtended() {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
        decoration: BoxDecoration(color: widget.color),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_getPerson(), Divider(), _getDate(), _getAge()]));
  }

  Widget _getPerson() {
    return Container(
        width: double.infinity,
        child: Text(widget.person,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.amethystColor)));
  }

  Widget _getConfirmDeleteDialog(BuildContext context) {
    return AlertDialog(
        title: const Text("Supprimer Anniversaire"),
        content: Text(
            "Etes vous sur de vouloir supprimer l'anniversaire de ${widget.person} ?"),
        actions: [
          TextButton(
              child: const Text("NON", style: TextStyle(color: Colors.red)),
              onPressed: () => Navigator.pop(context)),
          TextButton(
              child: const Text("OUI",
                  style: TextStyle(color: AppColors.peterRiverMColor)),
              onPressed: () {
                widget.callback(widget.person);
                Navigator.pop(context);
              })
        ]);
  }

  Text _getDate() {
    var text =
        "${widget.date.day} ${Utils.getMonthName(widget.date.month)} ${widget.date.year}";
    return Text(text, style: styleDate);
  }

  Widget _getAge() {
    return Text("${Utils.currentAge(widget.date)} ans", style: styleMore);
  }
}
