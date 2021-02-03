import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tober/data/user.dart';
import 'package:tober/widgets.dart';

class GeneralPage extends StatefulWidget {
  @override
  _GeneralPageState createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        formElement(userInfo.fio, "Ф. И. О.", (value) {
          userInfo.fio = value;
        }),
        formElement(null, "Дата рождения", null, () {
          getDate();
        }, null, _birthDayFieldController),
        formElement(userInfo.age, "Возраст", (value) {
          userInfo.age = value;
        }, null, TextInputType.number),
        formElement(userInfo.education, "Образование", (value) {
          userInfo.education = value;
        }),
        formElement(userInfo.profession, "Профессия", (value) {
          userInfo.profession = value;
        }),
        formElement(userInfo.firstMensesAge,
            "Возраст, в котором появились первые менструации", (value) {
          userInfo.firstMensesAge = value;
        }, null, TextInputType.number)
      ],
    );
  }

  final TextEditingController _birthDayFieldController = TextEditingController();
  @override
  void initState() {
    _birthDayFieldController.text = userInfo.birthDay;
    super.initState();
  }

  Future getDate() async {
    var date = await getDatePicker(context);
    String formattedDate = DateFormat('dd MMMM yyyy', "ru").format(date);
    this.setState(() {
      userInfo.birthDay = formattedDate;
      _birthDayFieldController.text = userInfo.birthDay;
    });
  }
}
