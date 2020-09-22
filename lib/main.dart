import 'dart:developer';

import 'package:flutter/material.dart';
import './page.dart';
import './data.dart';
import 'answers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Методика ТОБер',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Методика ТОБер'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PageData> dataSet = [
    PageData("1. Самочувствие", health),
    PageData("2. Настроение", mood),
    PageData("3. Отношение к ребенку", attitudeChild),
    PageData("4. Отношение к родам", childbirth),
    PageData("5. Отношение к врачам", attitudeDoctors),
    PageData("6. Отношение к мужу", attitudeHusband),
    PageData("7. Отношение к близким", attitudeLovedOnes),
    PageData("8. Отношение к окружающим", attitudeOthers),
    PageData("9. Отношение к образу жизни в период беременности", attitudeLifestyle),
    PageData("10. Отношение к образу жизни после родов", afterChildbirth)
  ];
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    Function() next = (){
      log("next $pageIndex");
      setState(() {
        if(pageIndex < 9) {
          pageIndex++;

        }
      });
    };
    Function() prev = (){
      log("prev $pageIndex");
      setState(() {
        if(pageIndex > 0) {
          pageIndex--;
        }
      });
    };
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: PageList(dataSet[pageIndex], next, prev));
  }
}