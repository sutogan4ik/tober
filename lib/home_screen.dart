import 'package:flutter/material.dart';
import 'package:tober/result_screen.dart';

import 'blank.dart';
import 'data/answers.dart';
import 'data/data.dart';
import 'page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<HomeScreen> {
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
      this.setState(() {
        if(pageIndex < dataSet.length) {
          pageIndex++;

        }
      });
    };
    Function() prev = (){
      this.setState(() {
        if(pageIndex > 0) {
          pageIndex--;
        }
      });
    };
    Function() resultListener = (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultScreen(dataSet)),
      );
    };
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: pageIndex == dataSet.length ? ResultBlank(dataSet, prev, resultListener) : PageList(dataSet[pageIndex], next, prev));
  }
}