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
  // final PageData healthPage = PageData("1. Самочувствие", health);
  // final PageData moodPage = PageData("2. Настроение", mood);
  // final PageData attitudeChildPage = PageData("3. Отношение к ребенку", attitudeChild);
  // final PageData childbirthPage = PageData("4. Отношение к родам", childbirth);
  // final PageData attitudeDoctorsPage = PageData("5. Отношение к врачам", attitudeDoctors);
  // final PageData attitudeHusbandPage = PageData("6. Отношение к мужу", attitudeHusband);
  // final PageData attitudeLovedOnesPage = PageData("7. Отношение к близким", attitudeLovedOnes);
  // final PageData attitudeOthersPage = PageData("8. Отношение к окружающим", attitudeOthers);
  // final PageData attitudeLifestylePage = PageData("9. Отношение к образу жизни в период беременности", attitudeLifestyle);
  // final PageData afterChildbirthPage = PageData("10. Отношение к образу жизни после родов", afterChildbirth);
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
    // switch(pageIndex){
    //   case 0:
    //     page = PageList(healthPage, next, null);
    //     break;
    //   case 1:
    //     page = PageList(moodPage, next, prev);
    //     break;
    //   case 2:
    //     page = PageList(attitudeChildPage, next, prev);
    //     break;
    //   case 3:
    //     page = PageList(childbirthPage, next, prev);
    //     break;
    //   case 4:
    //     page = PageList(attitudeDoctorsPage, next, prev);
    //     break;
    //   case 5:
    //     page = PageList(attitudeHusbandPage, next, prev);
    //     break;
    //   case 6:
    //     page = PageList(attitudeLovedOnesPage, next, prev);
    //     break;
    //   case 7:
    //     page = PageList(attitudeOthersPage, next, prev);
    //     break;
    //   case 8:
    //     page = PageList(attitudeLifestylePage, next, prev);
    //     break;
    //   case 9:
    //     page = PageList(afterChildbirthPage, next, prev);
    //     break;
    // }
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: PageList(dataSet[pageIndex], next, prev));
  }
}