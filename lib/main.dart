import 'package:birthday_app/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:birthday_app/screens/main_screen.dart';
import 'package:birthday_app/services/database.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  Database().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Birthday Reminder',
        theme: ThemeData(primarySwatch: AppColors.cloudsMColor),
        home: MainScreen(),
        localizationsDelegates: [GlobalMaterialLocalizations.delegate],
        supportedLocales: [const Locale('fr')]);
  }
}
