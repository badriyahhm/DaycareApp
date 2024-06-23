import 'package:daycare/screen/listanak.dart';
import 'package:flutter/material.dart';
import 'screen/login.dart';
import 'package:daycare/screen/home_orangtua.dart';
import 'package:daycare/screen/dailyreport.dart';
import 'models/datapengasuh.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daycare App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
